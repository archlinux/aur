# Maintainer: KUMAX <kumax2048@pm.me>

pkgname=btrbk-pac-git
pkgrel=1
pkgver=r35.d0e14d1
pkgdesc="A set of scripts and pacman hooks which automate btrbk processes and logs the relevant snapshot and information."
url="https://gitlab.com/KodyVB/btrbk-pac"
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=('btrbk')
makedepends=('git')
source=("git+${url}.git" btrbk_logger.conf ${pkgname%-git}.install)
install="${pkgname%-git}.install"
backup=("etc/btrbk_logger/btrbk_logger.conf")
sha256sums=(
'SKIP'
'd0b4b26a5fac3fc765e83ea9e76d9067379798e4526a39d094354b41705f7322'
'd26f0a77f7bcc84b049589a8049b956262e507eedcca603258b41067a89c9a57'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 scripts/btrbk_pac_log ${pkgdir}/usr/bin/btrbk_pac_log
  install -Dm755 scripts/btrbk_pac_log_script ${pkgdir}/usr/share/libalpm/scripts/btrbk_pac_log_script
  install -Dm644 hooks/00-btrbk-pre.hook ${pkgdir}/usr/share/libalpm/hooks/00-btrbk-pre.hook
  install -Dm644 hooks/zx-btrbk-post.hook ${pkgdir}/usr/share/libalpm/hooks/zx-btrbk-post.hook
  install -Dm644 etc/btrbk_logger.conf.example ${pkgdir}/etc/btrbk_logger/btrbk_logger.conf.example
  cd ${srcdir}
  install -Dm644 btrbk_logger.conf ${pkgdir}/etc/btrbk_logger/btrbk_logger.conf
}
