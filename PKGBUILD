# $Id$
# Maintainer: novenary <streetwalkermc@gmail.com>

pkgname=numix-themes-blue-git
pkgver=2.6.6.r44.430d6be
pkgrel=1
pkgdesc='A flat and light theme with a modern look and softer accents (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git' 'ruby-bundler' 'inkscape')
conflicts=('numix-themes-blue')
replaces=('numix-themes-blue')
source=("git+https://github.com/shimmerproject/Numix.git"
        "Gemfile")
sha256sums=('SKIP'
            'b1061ba7ce09c9eb3e41f59362aa8c21d27073b0658f13fb5eabdaea654afe2c')

pkgver() {
  cd Numix

  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

prepare() {
  cd Numix/src

  # Kill it all
  ORANGE=('f0544c' 'd64937' 'f1544d' 'f06860' 'fc6f5d')
  for FILE in $(find -type f)
  do
    for O in ${ORANGE[@]}
    do
      sed -i "s/#${O}/#2d81e5/g" "${FILE}"
    done
    sed -i 's/Numix/Numix-Blue/' "${FILE}"
  done

  cd assets
  rm -f *.png
  SVG="all-assets.svg"
  for FILE in $(cat all-assets.txt)
  do
    inkscape "${SVG}" -i "EXP-${FILE}" -o "${FILE}.png"
    inkscape "${SVG}" -i "EXP-${FILE}" -d 192 -o "${FILE}@2.png"
  done
}

build() {
  cd Numix

  bundle install --path .
  make SASS="bundle exec sass"
}
package() {
  cd Numix

  install -dm 755 "$pkgdir"/usr/share/themes/Numix-Blue
  cp -dr --no-preserve='ownership' src/* "$pkgdir"/usr/share/themes/Numix-Blue/
}

# vim: ts=2 sw=2 et:
