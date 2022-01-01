# Maintainer:  mrxx <mrxx at cyberhome dot at>

pkgname=endlessh-git
_pkgname=endlessh
pkgver=r100.dfe44eb
pkgrel=1
pkgdesc="A tarpit to lock up SSH clients"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/skeeto/endlessh"
license=('custom')
depends=()
makedepends=('git')
conflicts=('endlessh')
replaces=('endlessh')
source=('git+https://github.com/skeeto/endlessh' 'endlessh.conf')
sha256sums=('SKIP'
            '9aa763197e6920fb04f084407c267863b9da2827d785015f65c876c2315f783d')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  sed -i 's|endlessh/config|endlessh.conf|' endlessh.c
  sed -i "s|CFLAGS  =.*|CFLAGS  = -std=c99 -Wall -Wextra -Wno-missing-field-initializers -D_FORTIFY_SOURCE=2 -O2 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -ftrapv -s -g -Wl,-z,relro,-z,now -Wl,-z,noexecstack -pipe -Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong -fstack-clash-protection --param ssp-buffer-size=4 -fPIE -pie -mtune=generic|" Makefile
  make
}

package() {
  install -d "$pkgdir"/etc
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/lib/systemd/system
  install -d "$pkgdir"/usr/share/licenses/$_pkgname

  install -Dm644 endlessh.conf "$pkgdir"/etc/
  cd "$srcdir/$_pkgname"
  install -Dm755 endlessh "$pkgdir"/usr/bin/
  sed 's|usr/local/bin|usr/bin|g;s|30sec|30|;s|/run ||' util/endlessh.service |grep -vE 'ConfigurationDirectory|PrivateUsers' >"$pkgdir"/usr/lib/systemd/system/endlessh.service
  install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

