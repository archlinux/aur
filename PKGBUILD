# Maintainer: grimi <grimi at poczta dot fm>

pkgname=numix-themes-green
pkgver=2.6.1
pkgrel=1
pkgdesc="A flat and light theme with a modern look using Green color (GNOME, MATE, Openbox, Unity, XFCE)"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('ruby-bundler' 'imagemagick')
source=("${pkgname%-*}-${pkgver}.tar.gz::https://github.com/numixproject/numix-gtk-theme/archive/${pkgver}.tar.gz")
md5sums=('499e2e8e9d7d1d81403ebf8f65c8ced6')


prepare() {
   cd numix-gtk-theme-${pkgver}
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
      index.theme \
      Makefile
   do
      sed -i 's/#f0544c/#697740/Ig'  "${FILE}"
      sed -i 's/#d64937/#697740/Ig'  "${FILE}"
      sed -i 's/#f06860/#697740/Ig'  "${FILE}"
      sed -i 's/#f44336/#697740/Ig'  "${FILE}"
      sed -i 's/#444444/#333333/g'   "${FILE}"
      sed -i 's/#444/#333/g'         "${FILE}"
      sed -i 's/Numix/Numix-Green/I' "${FILE}"
   done


   # fix name change
   cp gtk-3.0/assets/radio-{selected,checked}.svg
   cp gtk-3.0/assets/radio-{selected,checked}-dark.svg

   for FILE in gtk-3.0/assets/*.svg
   do
      if [[ -f ${FILE%.svg}.png ]]
      then
         convert -resize 16x16 -background none "${FILE}" "${FILE%.svg}.png"
      fi
   done

   echo -e "source 'https://rubygems.org'\ngem 'sass'" > Gemfile
}


build() {
   cd numix-gtk-theme-${pkgver}
   bundle install --path .
   make SASS="bundle exec sass"
}


package() {
   cd numix-gtk-theme-${pkgver}
   make SASS="bundle exec sass" DESTDIR="${pkgdir}" install
   #rm -rf .git .gitignore CREDITS LICENSE README.md Makefile Gemfile{,.lock} ruby circle.yml
   #install -dm 755 "${pkgdir}"/usr/share/themes/Numix-Green
   #cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Numix-Green
}
