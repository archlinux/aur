# Maintainer: redfish <redfish@galactica.pw>

pkgname=ncprop279
pkgver=0.0.4
pkgrel=1

pkgdesc='Bridge between Tor Prop279 clients and Namecoin'
url='https://github.com/namecoin/ncprop279'
arch=(x86_64 armv7h)
license=(GPL-3)

depends=('stemns>=0.3')

# Dependency that needs a subfolder (rpcclient) wrapped into a go module
_btcd_ver=0.22.0-beta
# Dependencies that need a 'go generate' step
_certinject_ver=0.1.1
_x509_compressed_ver=0.0.3
_gen_deps=("certinject=${_certinject_ver}" "x509-compressed=${_x509_compressed_ver}")

optdepends=(
	'namecoin-core: Namecoin node to use'
	'tor: Tor node to serve'
)
makedepends=(go)
install=ncprop279.install
backup=("etc/ncprop279.conf")

source=($pkgname-$pkgver.tar.gz::https://github.com/namecoin/ncprop279/archive/v${pkgver}.tar.gz
  certinject-${_certinject_ver}.tar.gz::https://github.com/namecoin/certinject/archive/v${_certinject_ver}.tar.gz
  x509-compressed-${_x509_compressed_ver}.tar.gz::https://github.com/namecoin/x509-compressed/archive/v${_x509_compressed_ver}.tar.gz
  btcd-${_btcd_ver}.tar.gz::https://github.com/namecoin/btcd/archive/v${_btcd_ver}.tar.gz
  x509-compressed--drop-godebug-options.patch)

#  #btcsuite-btcd-${_btcd_ver}.tar.gz::https://github.com/btcsuite/btcd/archive/v${_btcd_ver}.tar.gz
#  #namecoin-btcd-${_btcd_ver}.tar.gz::https://github.com/namecoin/btcd/archive/v${_btcd_ver}.tar.gz
## btcsuite/btcd and namecoin/btcd conlict, so extract into separate dirs maually
#noextract=(btcsuite-btcd-${_btcd_ver}.tar.gz namecoin-btcd-${_btcd_ver}.tar.gz)

noextract=(btcd-${_btcd_ver}.tar.gz)

_gopath_dir="_gopath"

prepare() {
  export GOPATH="$srcdir/${_gopath_dir}"

  local _mod_rewrites=(
      # Workaround for a problem with a downstream dependency, whose
      # public path has changed, see
      # https://github.com/alecthomas/kingpin/commit/2e61e1e95c3b456c2414aada0efb75737df3b9a5
    "-replace=gopkg.in/alecthomas/kingpin.v2=github.com/alecthomas/kingpin/v2@v2.3.2"
  )

  cd $srcdir

  # Goal: wrap btcd/rpcclient into a go module.
  # Motivation: otherwise 'go mod tidy' fails with rpcclient/go.mod not found.
  # Sub-issue: the dependency tree contains references to both .../namecoin/btcd
  #   and ../btcsuite/btcd module paths, but only the namecoin fork works,
  #   because it exports some types from rpcclient.
  # Resolution: have both module paths point to the same source tree.
  # Sidenote: go mod does not allow a '-replace' where multiple paths are rewritten
  #   into one same path, so we achieve the goal by rewriting both paths into
  #   separate local source directories (which have the same contents).
  #
  # The purpose of source dirs for btcd is to wrap btcd/rpcclient into module.
  local _btcd_subdir="btcd-${_btcd_ver}"
  local _btcd_src
  for _btcd_src in btcsuite namecoin
  do
    local _btcd_dir="${_btcd_src}-${_btcd_subdir}"
    mkdir -p "${_btcd_dir}"
    pushd "${_btcd_dir}"
    tar xf "../btcd-${_btcd_ver}.tar.gz"

    pushd "${_btcd_subdir}"
    # Rewrite path to btcd for build of btcd; otherwise, this build of btcd in
    # this local subdir, still picks up and downloads a diferent version of
    # btcd. This appears to be non-fatal to the all of subsequent build of the
    # package, but does not seem correct, so rewrite the path.
    # Absolute path is required, since consumed by other modules in GOPATH.
    _mod_rewrites+=("-replace=github.com/${_btcd_src}/btcd=$srcdir/${_btcd_dir}/${_btcd_subdir}")
    go mod edit ${_mod_rewrites[*]}
    go mod tidy

    # Wrap rpcclient into a go module, otherwise would get an error that no go.mod
    pushd "rpcclient"
    go mod init github.com/${_btcd_src}/btcd/rpcclient
    go mod edit ${_mod_rewrites[*]}
    go mod tidy
    _mod_rewrites+=("-replace=github.com/${_btcd_src}/btcd/rpcclient=$srcdir/${_btcd_dir}/${_btcd_subdir}/rpcclient")
    popd # rpcclient
    popd # ${_btcd_subdir}
    popd # ${_btcd_dir}
  done

  # Wrap the special dependencies that need a 'go generate' step into go modules
  local _dep_ver
  for _dep_ver in ${_gen_deps[*]}
  do
    local _dep=${_dep_ver%=*}
    local _ver=${_dep_ver#*=}
    pushd "${_dep}-${_ver}"
    go mod init github.com/namecoin/${_dep}
    go mod edit ${_mod_rewrites[*]}
    go mod tidy
    go generate ./...
    go mod tidy
    _mod_rewrites+=("-replace=github.com/namecoin/${_dep}=../${_dep}-${_ver}")
    popd
  done

  # Wrap the top-level application executable into a module
  pushd "$pkgname-$pkgver"

  # TODO: change namecoin/ -> btcsuite/ because ncdns/namecoin declares the function
  # as btcsuite/ type not as namecoin/ type.
  # Upstream: https://github.com/namecoin/ncprop279/issues/39
  # Otherwise build fails with a type mismatch:
  #     # github.com/namecoin/ncprop279
  #     ./ncprop279.go:57:30: cannot use connCfg (variable of
  #      type *"github.com/namecoin/btcd/rpcclient".ConnConfig)
  #      as *"github.com/btcsuite/btcd/rpcclient".ConnConfig value
  #      in argument to namecoin.New
  sed -i 's|"github.com/namecoin/btcd/rpcclient"|"github.com/btcsuite/btcd/rpcclient"|' *.go
  go mod init github.com/namecoin/ncprop279
  go mod edit ${_mod_rewrites[*]}
  go mod tidy
  popd

  # Patch a minor issue, where 'internal' godebug module is used by disallowed
  # Upstream: https://github.com/namecoin/x509-compressed/pull/4
  pushd "x509-compressed-${_x509_compressed_ver}"
  patch -p1 -i ../x509-compressed--drop-godebug-options.patch
  popd
}

build() {
  export GOPATH="$srcdir/${_gopath_dir}"
  cd "$srcdir/$pkgname-$pkgver"
  go build ./...
}

package() {
  export GOPATH="$srcdir/${_gopath_dir}"
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 ncprop279 "$pkgdir/usr/bin/ncprop279"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm 644  "$srcdir"/$pkgname-$pkgver/_doc/ncprop279.conf.example "$pkgdir/etc/ncprop279.conf"
}

sha512sums=('82a663134d8d8d6a00b778d77fd156ea026493b82084582abcf5309a987e5fe6af34b82b3048f7b4acb0afaf84feb852afc686675f499245bbf559233313d85c'
            'e4e4888558fdc8abe53daf8850ea0deb41ef79fcfae70d78dcc50da6a1f7e24240e8d978f48bcb2a8f4c1811afd87a71a5c97789882f6973ab6477b679037914'
            'b2df29980557a10a2d7798ba43639437223ef554ee66e78a1a0e67e39484e3edc136d5d68a4ad1f9414bc6649e32a67e17fad883a8ba5d2d4d7f74f3d130defe'
            '495daf7f3d63d28c85c631746be6196e38f74dab3e85d8de316a666ecf3f203c5fc3e840733062ffd2c8a612e95a1029ed071b526cc21ab590ff2f2eb2dec35e'
            'ced953e98ad47868985caca36ff100636c1e96d45960b690d81c27ddda9879f7c10dfc6cfde503aacdfa5b9c50fb7ac9e02fd1b49892b2ec64b23a00548ae80c')
