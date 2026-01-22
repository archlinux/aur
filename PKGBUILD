# Maintainer: Joshua Su <i@joshua.su>
pkgname=gemini-desktop-git
_pkgname=gemini-desktop
pkgver=r38.4f0a586
pkgrel=1
pkgdesc="Unofficial Web app for Google Gemini providing the desktop user experience (Git version)"
arch=('x86_64')
url="https://github.com/kenvandine/gemini-desktop"
license=('GPL3')
depends=('electron')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        "$_pkgname.sh")
sha256sums=('SKIP'
            '0c2b2f56473490b2b110f6ea84301232faf43c505fab6e9804fbe555c9029382')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install application source files to /usr/lib/gemini-desktop
  install -d "$pkgdir/usr/lib/$_pkgname"
  
  local _files=(
    "index.js"
    "preload.js"
    "renderer.js"
    "index.html"
    "about.html"
    "offline.html"
    "package.json"
    "icon.png"
    "icon512.png"
  )

  for _file in "${_files[@]}"; do
    install -m644 "$_pkgname/$_file" "$pkgdir/usr/lib/$_pkgname/$_file"
  done

  # Install the launcher script
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  cd "$_pkgname"

  # Install and fix the desktop file
  install -d "$pkgdir/usr/share/applications"
  sed -e "s|Icon=.*|Icon=$_pkgname|" \
      -e "s|Exec=.*|Exec=/usr/bin/$_pkgname|" \
      com.github.kenvandine.gemini-desktop.desktop > "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install the icon
  install -d "$pkgdir/usr/share/pixmaps"
  install -m644 icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
