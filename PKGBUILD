# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
#
# Contributor: Stefano Capitani <@ste74>

pkgname=kernel-alive-git
pkgver=r30.3182821
pkgrel=1
pkgdesc="port of Manjaro kernel-alive, keep previous kernel modules until next reboot."
arch=('x86_64' 'i686')
url="https://gitlab.manjaro.org/ste74/kernel-alive"
license=('GPL')
depends=('rsync>=2.0.0')
install=kernel-alive.install

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%-git}::git+${url}#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

f_hooks="kernel-alive-post.hook kernel-alive-pre.hook"
f_scripts="kernel-alive-post.script kernel-alive-pre.script"
f_svcs="linux-module-cleanup.service"
f_svc_sh="linux-module-cleanup.script"

package() {
  install -dm755 "${pkgdir}/usr/share/libalpm/scripts"
  install -dm755 "${pkgdir}/etc/pacman.d/hooks"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  for f in $f_hooks; do
      install -Dm644 "${srcdir}/${pkgname%-git}/$f" "${pkgdir}/etc/pacman.d/hooks/"
  done
  for f in $f_scripts; do
      install -Dm755 "${srcdir}/${pkgname%-git}/$f" "${pkgdir}/usr/share/libalpm/scripts/${f%.script}"
  done
  for f in $f_svcs; do
      install -Dm644 "${srcdir}/${pkgname%-git}/$f" "${pkgdir}/usr/lib/systemd/system/"
  done
  for f in $f_svc_sh; do
      install -Dm644 "${srcdir}/${pkgname%-git}/$f" "${pkgdir}/usr/bin/"
  done
}

