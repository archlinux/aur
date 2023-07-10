# Submitter: chendaniely
#
# Maintainer: chendaniely <chendaniely@gmail.com>
# code adapted from: Meow < a.li.devtty at gmail dot com >
#
# Previous maintainer(s)
# Maintainer: pat-s <patrick.schratz@gmail.com>
#######################

pkgname=rstudio-desktop-preview-bin
pkgver=2023.03.2.454
pkgver_url=2023.03.2-454
pkgrel=1
pkgdesc="An integrated development environment (IDE) for R (binary version from RStudio official repository)"
arch=('x86_64')
license=('GPL')
url="http://www.rstudio.org/"
depends=('r' 'hicolor-icon-theme' 'libxcomposite' 'libxslt' 'shared-mime-info' 'libxrandr' 'openssl-1.0' 'postgresql-libs')
#makedepends=('patchelf')
optdepends=('pandoc: markdown support')
conflicts=('rstudio-desktop' 'rstudio-desktop-git' 'rstudio-desktop-bin')
provides=("rstudio-desktop=${pkgver}")
options=(!strip)

sha256sums_x86_64=('9bd18b62cc2cf68d511c21397211a2975957cd0a53fab05d261244b7c5087a58')
#source_x86_64=("https://s3.amazonaws.com/rstudio-ide-build/desktop/bionic/amd64/rstudio-${pkgver_url}-amd64.deb")
source_x86_64=("https://s3.amazonaws.com/rstudio-ide-build/electron/jammy/amd64/rstudio-2023.03.2-454-amd64.deb")

package() {

	shopt -s extglob

  msg "Converting debian package..."

  ar x rstudio-${pkgver_url}-amd64.deb

  cd "$srcdir"
  tar Jxf data.tar.xz -C "$pkgdir"
  install -dm755 "$pkgdir/usr/bin"

  cd "$pkgdir/usr/lib/rstudio/bin/quarto/bin/"
  ln -sf /usr/bin/pandoc ./
  ln -sf /usr/bin/pandoc-citeproc ./

  find "$pkgdir/usr" -type d -print0 | xargs -0 chmod 755
  find "$pkgdir/usr" -type f -name '*.so.*' -print0 | xargs -0 chmod 644

  cd "$pkgdir/usr/bin"
  echo '#!/bin/sh
export QT_DIR=/usr/lib/rstudio/bin
export QT_PLUGIN_PATH=$QT_DIR/plugins
export QT_QPA_PLATFORM_PLUGIN_PATH=$QT_PLUGIN_PATH/platforms
export KDEDIRS=/usr
exec /usr/lib/rstudio/bin/rstudio "$@"
' > "$pkgdir/usr/bin/rstudio-bin"
  chmod 755 "$pkgdir/usr/bin/rstudio-bin"

  sed -i 's|/usr/lib/rstudio/bin/rstudio|/usr/bin/rstudio-bin --disable-seccomp-filter-sandbox|' "$pkgdir/usr/share/applications/rstudio.desktop"
}
