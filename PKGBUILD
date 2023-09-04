# Maintainer: redfish <redfish@galactica.pw>

pkgname=ncprop279
pkgver=0.0.4
pkgrel=2

pkgdesc='Bridge between Tor Prop279 clients and Namecoin'
url='https://github.com/namecoin/ncprop279'
arch=(x86_64 armv7h)
license=(GPL-3)

depends=('stemns>=0.3')

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
  x509-compressed--drop-godebug-options.patch)

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
  # or link errors like this:
  #  # github.com/namecoin/ncrpcclient
  #   ../_gopath/pkg/mod/github.com/namecoin/ncrpcclient@v0.1.0/names.go:24:43:
  #   undefined: rpcclient.Response
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
            'ced953e98ad47868985caca36ff100636c1e96d45960b690d81c27ddda9879f7c10dfc6cfde503aacdfa5b9c50fb7ac9e02fd1b49892b2ec64b23a00548ae80c')
