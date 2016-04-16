# $Id$
# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Contributor: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=numix-themes-blue-git
pkgver=2.5.1.r199.bde0a73
pkgrel=1
pkgdesc='A flat and light theme with a modern look and softer accents (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git' 'ruby-bundler' 'svg2png')
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
  cd Numix

  for FILE in $(find -path ./.\* -prune -o -type f -print)
  do
    sed -i 's/#f0544c/#2d81e5/g' "${FILE}"
    sed -i 's/#d64937/#2d81e5/g' "${FILE}"
    sed -i 's/Numix/Numix-Blue/' "${FILE}"
  done

  cd gtk-3.0/assets
  rm -f *.png
  for FILE in *.svg
  do
    OUTNAME=$(echo ${FILE} | sed -e "s/selected/checked/" -e "s/\\.svg$/.png/")
    svg2png ${FILE} ${OUTNAME}
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
  cp -dr --no-preserve='ownership' * "$pkgdir"/usr/share/themes/Numix-Blue/
  rm -rf "$pkgdir"/usr/share/themes/Numix-Blue/{CREDITS,LICENSE,Makefile,README.md}
}

# vim: ts=2 sw=2 et:
