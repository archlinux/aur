# Maintainer: dr00tb <adam at dr00tb dot com>

pkgname=tkey-ssh-agent
_pkgname=tillitis-key1-apps
_libname=tkey-libs
_appname=tkey-device-signer
pkgver=0.0.8
_libver=0.0.2
pkgrel=1
pkgdesc="A ssh-agent for the Tillitis TKey"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/tillitis/tillitis-key1-apps"
license=('GPL2')
makedepends=('clang' 'llvm' 'lld' 'go')
conflicts=("${pkgname}2")
provides=("${pkgname}")
install=tkey-ssh-agent.install
source=("git+https://github.com/tillitis/${_pkgname}.git#commit=7e18bcb"
        "git+https://github.com/tillitis/${_libname}.git#tag=v${_libver}"
        "git+https://github.com/tillitis/${_appname}.git#tag=v${pkgver}")
b2sums=('SKIP'
        'SKIP'
        'SKIP')

build() {
  cd "${srcdir}/${_libname}"
  make OBJCOPY="llvm-objcopy"

  cd "${srcdir}/${_appname}"
  make OBJCOPY="llvm-objcopy" signer/app.bin

  cd "${srcdir}/${_pkgname}"
  cp "${srcdir}/${_appname}/signer/app.bin" ./cmd/tkey-ssh-agent/app.bin
  sed -i "s/tkey-ssh-agent: check-signer-hash/tkey-ssh-agent:/" Makefile
  make OBJCOPY="llvm-objcopy" tkey-ssh-agent
}

package() {
  destbin="${pkgdir}/usr/bin"
  destman1="${pkgdir}/usr/share/man/man1"
  destunit="${pkgdir}/usr/lib/systemd/user"
  destrules="${pkgdir}/etc/udev/rules.d"
  cd "${srcdir}/${_pkgname}"
	install -Dm755 tkey-ssh-agent "${destbin}/tkey-ssh-agent"
	strip "${destbin}"/tkey-ssh-agent
	install -Dm644 system/tkey-ssh-agent.1 "${destman1}"/tkey-ssh-agent.1
	gzip -n9f "${destman1}"/tkey-ssh-agent.1
	install -Dm644 system/tkey-ssh-agent.service.tmpl "${destunit}"/tkey-ssh-agent.service
	sed -i -e "s,##BINDIR##,/usr/bin," "${destunit}"/tkey-ssh-agent.service
	install -Dm644 system/60-tkey.rules "${destrules}"/60-tkey.rules
}

