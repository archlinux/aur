# Submitter: chendaniely
#
# Maintainer: chendaniely <chendaniely@gmail.com>
# code adapted from: Meow < a.li.devtty at gmail dot com >
#
# Previous maintainer(s)
# Maintainer: pat-s <patrick.schratz@gmail.com>
#######################

pkgname=rstudio-desktop-daily-bin
pkgver=2024.04.0.daily.624
pkgver_url=2024.04.0-daily-624
pkgrel=1
pkgdesc="An integrated development environment (IDE) for R (binary version from RStudio official repository)"
arch=('x86_64')
license=('GPL')
url="http://www.rstudio.org/"
depends=('r' 'hicolor-icon-theme' 'libxcomposite' 'libxslt' 'shared-mime-info' 'libxrandr' 'openssl' 'postgresql-libs')
#makedepends=('patchelf')
optdepends=(
    'pandoc: markdown support'
    'x11-ssh-askpass: password dialog for ssh'
)
conflicts=('rstudio-desktop' 'rstudio-desktop-git' 'rstudio-desktop-bin' 'rstudio-desktop-preview-bin')
provides=("rstudio-desktop-daily=${pkgver}")
options=(!strip)

sha256sums_x86_64=('97d8321a0e7a1a19e0b2440b1e1b967cf7a273b7493843e247916a9616665f5c')
source_x86_64=("https://s3.amazonaws.com/rstudio-ide-build/electron/jammy/amd64/rstudio-${pkgver_url}-amd64.deb")

package() {

	shopt -s extglob

  msg "Converting debian package..."

  ar x rstudio-${pkgver_url}-amd64.deb

  cd "$srcdir"
  tar Jxf data.tar.xz -C "$pkgdir"
  install -dm755 "$pkgdir/usr/bin"

  cd "$pkgdir/usr/lib/rstudio/resources/app/bin/quarto/bin/"
  ln -sf /usr/bin/pandoc ./pandoc
  #ln -sf /usr/bin/pandoc-citeproc ./

  find "$pkgdir/usr" -type d -print0 | xargs -0 chmod 755
  find "$pkgdir/usr" -type f -name '*.so.*' -print0 | xargs -0 chmod 644

  cd "$pkgdir/usr/bin"
  echo '#!/bin/sh
export QT_DIR=/usr/lib/rstudio/bin
export QT_PLUGIN_PATH=$QT_DIR/plugins
export QT_QPA_PLATFORM_PLUGIN_PATH=$QT_PLUGIN_PATH/platforms
export KDEDIRS=/usr
exec /usr/lib/rstudio/rstudio "$@"
' > "$pkgdir/usr/bin/rstudio-daily-bin"
  chmod 755 "$pkgdir/usr/bin/rstudio-daily-bin"

  sed -i 's|/usr/lib/rstudio/rstudio|/usr/bin/rstudio-daily-bin|' "$pkgdir/usr/share/applications/rstudio.desktop"
}
