# Maintainer: raven2cz <tonda.fischer@gmail.com>
# Contributor: raven2cz <tonda.fischer@gmail.com>

pkgname=image-scraper-suite-git
pkgver=ae73bc8.20240123.11
pkgrel=1
pkgdesc="ImageScraperSuite (ISS) is a Node.js script collection for automated image downloading and management."
url="https://github.com/raven2cz/ImageScraperSuite"
replaces=()
arch=("any")
license=("LGPL2.1")
depends=(
	"nodejs"
	"npm"
)
makedepends=("git")
provides=()
conflicts=()
source=("git+$url.git")
sha256sums=("SKIP")

_repo_name=ImageScraperSuite

pkgver() {
  cd "$srcdir/$_repo_name"
  _author_ver=$(git describe --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  _last_commit_date=$(git log -1 --pretty='%cd' --date=short | tr -d '-')
  _commit_count="$(git rev-list --count HEAD)"
  echo $_author_ver.$_last_commit_date.$_commit_count
}

build() {
  cd "$srcdir/$_repo_name"
  npm install
}

package() {
  cd "$srcdir/$_repo_name"

  install -d -m755 "$pkgdir/usr/share/$_repo_name"
  install -D -m755 "$srcdir/$_repo_name/music_image_scraper" "$pkgdir/usr/share/$_repo_name/music_image_scraper"
  install -D -m644 "$srcdir/$_repo_name/LICENSE" "$pkgdir/usr/share/$_repo_name/LICENSE"
  
  install -Dm755 -t "$pkgdir/usr/share/$_repo_name" *.js
  cp -r node_modules "$pkgdir/usr/share/$_repo_name/"

  # create wrapper script
  echo '#!/bin/bash' > music_image_scraper_wrapper
  echo "cd /usr/share/$_repo_name" >> music_image_scraper_wrapper
  echo './music_image_scraper "$@"' >> music_image_scraper_wrapper

  chmod +x music_image_scraper_wrapper
  install -Dm755 music_image_scraper_wrapper "$pkgdir/usr/share/$_repo_name/music_image_scraper_wrapper"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/$_repo_name/music_image_scraper_wrapper" "${pkgdir}/usr/bin/music_image_scraper"
  ln -s "/usr/share/$_repo_name/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

