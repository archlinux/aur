# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='eeedc9a387117ebb8cb9ee4d38eccbbf240783d0'
pkgname=alps
pkgver=2023.03.17
pkgrel=1
pkgdesc='A simple and extensible webmail'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://git.sr.ht/~migadu/alps'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
backup=("etc/${pkgname}.conf")
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~migadu/${pkgname}/archive/${_commit}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}-system.service"
        "${pkgname}-user.service"
        "${pkgname}-plugins-path.patch"
        "${pkgname}-themes-path.patch"
        "${pkgname}-fix-156.patch")
b2sums=('9d7bcfe02378a9ae5761fe7dca26e7365777c851ad9433ab46d9d83106c80704eb3b1c341b5edc454a7475b382113ef6f2fe7c1ec3a126f801574914d2c8e78e'
        '8c9109649da6b030cd1c7ff32a5db1034391a8858593b649e953bd074b7329181c52575403d22b59113760423d15e0fb3cb3e8cdf5feb8415efe5aba936ae0c5'
        '56f6f6439e537901c953a840ff08c70c9acf63b029e3298e612fb75c152d198f4d1535327b911790c01ca74b5ef5bba2a98c2fb4f14180727a457ea5b846a74e'
        'a9ef4a29b26f950f3a1bd9f262a3c23bb731b79d15ff0cee979692b0b99cb0b678ed54da7fe36449ca146aa7e1da7ba7302fb7afc4620ef1a07a119ba789464c'
        'b3bc983fa8350e36ff176e882bf7b67cb5ba4c0863e70c9cb5c2bd78a0ee12504ae997dec44cb008e68ead14d08dd30ea33719f0a107b170d6906ee4d69f8e5d'
        'f34d00a82db978ade7c92ca13109e73be25fdff5046e2e9f279c09733a7ce7a5e11b368ddd76234d154b9af0fd917901fda2c2b33d3f41342b3a5f6d8e6afb21'
        'd4120519c80efb2ae4ba486aaa02f1fa78520c004627ec86a816ba05bf8080ea7ea254337a54084eeab83f262a0887c2f83fee817a8df83d471bfd9853bb8264')

prepare(){
  patch -d "${pkgname}-${_commit}" -p1 <"${pkgname}-plugins-path".patch
  patch -d "${pkgname}-${_commit}" -p1 <"${pkgname}-themes-path".patch
  patch -d "${pkgname}-${_commit}" -p1 <"${pkgname}-fix-156".patch
}

build() {
  cd "${pkgname}-${_commit}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o ${pkgname} ./cmd/alps
}

package() {
  # config
  install -D -m644 ${pkgname}.conf "${pkgdir}/etc/${pkgname}.conf"
  # services
  install -D -m644 ${pkgname}-system.service \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 ${pkgname}-user.service \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  cd "${pkgname}-${_commit}"
  # binary
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  # plugin assets
  install -d -m755 "${pkgdir}/usr/lib/${pkgname}/plugins"
  for plugin in plugins/*; do
    [ -d "${plugin}/public" ] && \
      install -d -m755 "${pkgdir}/usr/lib/${pkgname}/${plugin}" && \
      cp -a "${plugin}/public" \
        "${pkgdir}/usr/lib/${pkgname}/${plugin}"
  done
  # themes
  cp -a themes "${pkgdir}/usr/lib/${pkgname}"
  # docs
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cp -a docs "${pkgdir}/usr/share/doc/${pkgname}"
  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
