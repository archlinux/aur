pkgname=pyf9-git
_pkgname=PyF9
pkgver=r6.d2556d5
pkgrel=3
pkgdesc="Chinese IME in testing. No copyright infringing materials included."
arch=('i686' 'x86_64')
url="https://github.com/Saren-Arterius/PyF9"
depends=('xdotool' 'python-pillow' 'python-xlib' 'tk' 'xorg-xauth')
makedepends=('firefox' 'npm' 'xorg-server-xvfb' 'wget')
source=('git+https://github.com/Saren-Arterius/PyF9.git' 'pyf9.desktop')
sha256sums=('SKIP' 'a65cbaf96d480b154d257eeead5c1941079b0e5c257ba22c6e35a93b5628207f')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  echo Downloading image assets...
  cd "${_pkgname}/assets/"
  after_p=$(printf "\x$(printf %x 113)")
  arr=$(seq 0 9); arr+=(s)
  for i in ${arr[@]}; do
    wget -q "https://hk.dictionary.yahoo.com/static/MasterView/assets/${after_p}9/grx/${after_p}9_${i}.png" -O f9_${i}.png
  done
  rm please_grab_shit_from_their_website.sha1sum
  cd ../../

  echo Scrapping DB data... This might take up to few minutes
  cd "${_pkgname}/db-scrapper/"
  npm install
  npm start
}

package() {
  mkdir -p ${pkgdir}/opt/${_pkgname}
  install -Dm644 "pyf9.desktop" "${pkgdir}/usr/share/applications/pyf9.desktop"
  cd "${_pkgname}"
  install -Dm755 "main.py" "${pkgdir}/opt/${_pkgname}/pyf9"
  install -Dm644 "pyxhook.py" "${pkgdir}/opt/${_pkgname}/pyxhook.py"
  cp -r assets "${pkgdir}/opt/${_pkgname}"
}
