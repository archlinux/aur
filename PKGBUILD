# Maintainer: grimi <grimi at poczta dot fm>

pkgname=numix-themes-green
pkgver=2.5.1.r199.bde0a73
pkgrel=1
pkgdesc="A flat and light theme with a modern look using Green color (GNOME, MATE, Openbox, Unity, XFCE)"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git' 'ruby-bundler' 'imagemagick')
_commit='bde0a7364864b0e3b8265c5b13969757295e1e17'
source=("git+https://github.com/shimmerproject/Numix.git#commit=${_commit}" "Gemfile")
sha256sums=('SKIP'
            'b1061ba7ce09c9eb3e41f59362aa8c21d27073b0658f13fb5eabdaea654afe2c')



pkgver() {
   cd Numix
   git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}


prepare() {
   cd Numix
   for FILE in gtk-2.0/gtkrc \
      gtk-3.0/scss/_global.scss \
      gtk-3.0/assets/*.svg \
      gtk-3.20/scss/_global.scss \
      metacity-1/metacity-theme-2.xml \
      metacity-1/metacity-theme-3.xml \
      openbox-3/themerc \
      xfce-notify-4.0/gtkrc \
      xfwm4/themerc \
      xfwm4/*.xpm \
      unity/*.svg \
      index.theme
   do
      sed -i 's/#f0544c/#697740/Ig' "${FILE}"
      sed -i 's/#d64937/#697740/Ig' "${FILE}"
      sed -i 's/#f06860/#697740/Ig' "${FILE}"
      sed -i 's/#f44336/#697740/Ig' "${FILE}"
      sed -i 's/Numix/Numix-Green/I' "${FILE}"
   done

   # fix name
   cp gtk-3.0/assets/radio-{selected,checked}.svg
   cp gtk-3.0/assets/radio-{selected,checked}-dark.svg

   for FILE in gtk-3.0/assets/*.svg
   do
      if [[ -f ${FILE%.svg}.png ]]
      then
         convert -resize 16x16 -background none "${FILE}" "${FILE%.svg}.png"
      fi
   done
}


build() {
   cd Numix
   bundle install --path .
   make SASS="bundle exec sass"
}


package() {
   cd Numix
   install -dm 755 "${pkgdir}"/usr/share/themes/Numix-Green
   rm -rf .git .gitignore CREDITS LICENSE README.md
   cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Numix-Green
}

