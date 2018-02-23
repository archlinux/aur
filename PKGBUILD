# Maintainer: grimi <grimi at poczta dot fm>

pkgname=numix-themes-green
pkgver=2.6.7
pkgrel=2
pkgdesc="A flat and light theme with a modern look using Green color (GNOME, MATE, Openbox, Unity, XFCE)"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('ruby-bundler' 'inkscape')
source=("${pkgname%-*}-${pkgver}.tar.gz::https://github.com/numixproject/numix-gtk-theme/archive/${pkgver}.tar.gz" "gtk2rc.patch")
sha256sums=('2b997ad3eee0b802d0dd49dd772127fd3c337cca32d8863efd4897928e38879a'
            'f3d1de132ccb999fa8c7c1e1d545cfdb790d77e58a21097f24303bdc79c71ea3')


prepare() {
   local color="#697740" name="Green"
   cd numix-gtk-theme-${pkgver}
   patch -Np0 -i ../gtk2rc.patch
   cd src
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

