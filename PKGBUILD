# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>
# Contributor: Yan Doroshenko <yandoroshenko@protonmail.com>
# Contributor: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=numix-themes-archblue
pkgver=2.6.6.r51.b652b19
pkgrel=1
pkgdesc='A flat and light theme with a modern look and softer accents (GNOME, Openbox, Unity, Xfce) using the ArchLinux blue (#1793d1) and dark grey (#333333) colors'
arch=('any')
url='https://github.com/shimmerproject/Numix.git'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git' 'ruby-bundler' 'inkscape')
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
  GRAY=('444444')
  for FILE in $(find -type f)
  do
    for O in ${ORANGE[@]}
    do
      sed -i "s/#${O}/#1793d1/g" "${FILE}"
    done
    for G in ${GRAY[@]}
    do
      sed -i "s/#${G}/#333333/g" "${FILE}"
    done
    sed -i 's/Numix/Numix-Archblue/' "${FILE}"
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

  install -dm 755 "$pkgdir"/usr/share/themes/Numix-Archblue
  cp -dr --no-preserve='ownership' src/* "$pkgdir"/usr/share/themes/Numix-Archblue/
}
