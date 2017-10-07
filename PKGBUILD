# Maintainer: grimi <grimi at poczta dot fm>

pkgname=numix-themes-green
pkgver=2.6.7
pkgrel=1
pkgdesc="A flat and light theme with a modern look using Green color (GNOME, MATE, Openbox, Unity, XFCE)"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('ruby-bundler' 'inkscape')
source=("${pkgname%-*}-${pkgver}.tar.gz::https://github.com/numixproject/numix-gtk-theme/archive/${pkgver}.tar.gz")
sha256sums=('4590c6077828d73aecbc2521acf5b8d4669aacff1e9d09575888be67f2dc0d1b')


prepare() {
   local color="#697740" name="Green"
   cd numix-gtk-theme-${pkgver}/src
   for file in gtk-2.0/gtkrc \
      gtk-3.0/scss/_global.scss \
      assets/*.svg \
      gtk-3.20/scss/_global.scss \
      metacity-1/metacity-theme-2.xml \
      metacity-1/metacity-theme-3.xml \
      openbox-3/themerc \
      xfce-notify-4.0/gtkrc \
      xfwm4/themerc \
      xfwm4/*.xpm \
      unity/*.svg \
      index.theme \
      ../Makefile
   do
      sed -i "s/#f1544d/$color/Ig"     "${file}"
      sed -i "s/#f0544c/$color/Ig"     "${file}"
      sed -i "s/#f06860/$color/Ig"     "${file}"
      #sed -i "s/#444444/#333333/g"     "${file}"
      #sed -i "s/#444/#333/g"           "${file}"
      sed -i "s/Numix/Numix-$name/I" "${file}"
   done

   rm assets/*.png
   ../scripts/render-assets.sh

   echo -e "source 'https://rubygems.org'\ngem 'sass'" > ../Gemfile
}


build() {
   cd numix-gtk-theme-${pkgver}
   bundle install --path .
   make SASS="bundle exec sass"
}


package() {
   cd numix-gtk-theme-${pkgver}
   make SASS="bundle exec sass" DESTDIR="${pkgdir}" install
}

