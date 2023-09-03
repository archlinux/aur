# Maintainer: redfish <redfish@galactica.pw>

pkgname=ncdns
pkgver=0.3.2
pkgrel=1
_certinject_ver=0.1.1
_x509_compressed_ver=0.0.3
_gen_deps=("certinject=${_certinject_ver}" "x509-compressed=${_x509_compressed_ver}")

pkgdesc='Namecoin to DNS bridge daemon'
url='https://github.com/namecoin/ncdns'
arch=(x86_64 armv7h)
license=(GPL-3)

depends=(libcap)
optdepends=('namecoin-core: the Namecoin node')
makedepends=(go)
install="ncdns.install"
backup=("etc/ncdns.conf")

source=($pkgname-$pkgver.tar.gz::https://github.com/namecoin/ncdns/archive/v${pkgver}.tar.gz
  certinject-${_certinject_ver}.tar.gz::https://github.com/namecoin/certinject/archive/v${_certinject_ver}.tar.gz
  x509-compressed-${_x509_compressed_ver}.tar.gz::https://github.com/namecoin/x509-compressed/archive/v${_x509_compressed_ver}.tar.gz
  x509-compressed--drop-godebug-options.patch
  ncdns.service)

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
  go mod init github.com/namecoin/ncdns
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

  go install ./...

  install -Dm 755 $GOPATH/bin/ncdns "$pkgdir/usr/bin/ncdns"
  install -Dm 644 $srcdir/ncdns.service "$pkgdir/usr/lib/systemd/system/ncdns.service"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md _doc/ncdns.conf.example
  # we copy from template, but user must edit the conf file before starting service
  install -Dm 644  _doc/ncdns.conf.example "$pkgdir/etc/ncdns.conf"
}

sha512sums=('f56f9b4f7c740370d0c07c437835c29158a5898892726492c130c4c3df79add6c03dc5a905c7564e7be2efa01a346ed3ef6895640557af9a4f0a4d30dccafa2a'
            'e4e4888558fdc8abe53daf8850ea0deb41ef79fcfae70d78dcc50da6a1f7e24240e8d978f48bcb2a8f4c1811afd87a71a5c97789882f6973ab6477b679037914'
            'b2df29980557a10a2d7798ba43639437223ef554ee66e78a1a0e67e39484e3edc136d5d68a4ad1f9414bc6649e32a67e17fad883a8ba5d2d4d7f74f3d130defe'
            'ced953e98ad47868985caca36ff100636c1e96d45960b690d81c27ddda9879f7c10dfc6cfde503aacdfa5b9c50fb7ac9e02fd1b49892b2ec64b23a00548ae80c'
            '4fca961ae7fc17fbb159dc6cfe3bf6be52b7e1423f0c04591100780a72f250cb87263e3eb736b363d2e67dbd8485018cbaa720ccaa4450bb93d220f802b4be40')
sha512sums=('f56f9b4f7c740370d0c07c437835c29158a5898892726492c130c4c3df79add6c03dc5a905c7564e7be2efa01a346ed3ef6895640557af9a4f0a4d30dccafa2a'
            'e4e4888558fdc8abe53daf8850ea0deb41ef79fcfae70d78dcc50da6a1f7e24240e8d978f48bcb2a8f4c1811afd87a71a5c97789882f6973ab6477b679037914'
            'b2df29980557a10a2d7798ba43639437223ef554ee66e78a1a0e67e39484e3edc136d5d68a4ad1f9414bc6649e32a67e17fad883a8ba5d2d4d7f74f3d130defe'
            'ced953e98ad47868985caca36ff100636c1e96d45960b690d81c27ddda9879f7c10dfc6cfde503aacdfa5b9c50fb7ac9e02fd1b49892b2ec64b23a00548ae80c'
            '3b253277aa0b198f5db8d0247a27164caaac0c99d680a325b84f7a1faf9a39afdf90411802657fd39c72fd4a5fa973ed43ccd41390405f1ec549b980a23a5814')
