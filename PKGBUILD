pkgname=numix-themes-electric
pkgver=2.6.6
pkgrel=1
pkgdesc='A flat and light theme with a modern look using Arch Linux colors (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('glib2' 'gdk-pixbuf2' 'ruby-bundler' 'inkscape')
depends=('gtk-engine-murrine')
source=("numix-themes-${pkgver}.tar.gz::https://github.com/numixproject/numix-gtk-theme/archive/${pkgver}.tar.gz"
        'Gemfile')
md5sums=('7533cdecb2e9f875cd7efc881b8d65a3'
         '2a6b61ff91955c37fa60a972a67631cf')

_electric_color='#00BFFF'
_get_color() {
    grep -E "@define-color\\s+\\w*$1" src/gtk-3.20/dist/gtk-dark.css | head -n1 | cut -d' ' -f3 | cut -d';' -f1
}

prepare() {
    cd ${srcdir}/numix-gtk-theme-${pkgver}
    sed -i 's/\$variant: "light";/\$variant: "dark";/' src/gtk-3.{,2}0/scss/gtk.scss

    for name in selected_bg_color link_color
    do
        sed -i "s/\$${name}: #.\{6\};/\$${name}: ${_electric_color};/" src/gtk-3.{,2}0/scss/_global.scss
    done

    rm src/assets/*.png
    sed -i "s/fill:#f1544d/fill:${_electric_color}/g" src/assets/all-assets.svg
}

build() {
    cd ${srcdir}/numix-gtk-theme-${pkgver}/scripts
    ./render-assets.sh
    cd ..

    bundle install --path .
    make SASS="bundle exec sass"

    names='bg_color fg_color base_color text_color selected_bg_color selected_fg_color tooltip_bg_color tooltip_fg_color titlebar_bg_color titlebar_fg_color menubar_bg_color menubar_fg_color toolbar_bg_color toolbar_fg_color menu_bg_color menu_fg_color panel_bg_color panel_fg_color'

    for name in $names
    do
        color=$(_get_color $name)

        if [[ $color = "@"* ]]
        then
            color=$(_get_color $(echo $color | cut -d'@' -f2))
        fi

        sed -i "s/$name:#.\{6\}/$name:$color/" src/gtk-2.0/gtkrc
    done

    sed -i "s/selected_bg_color:#.\{6\}/selected_bg_color:${_electric_color}/" src/gtk-2.0/gtkrc
    sed -i "s/link_color:#.\{6\}/link_color:${_electric_color}/" src/gtk-2.0/gtkrc
}

package() {
    cd ${srcdir}/numix-gtk-theme-${pkgver}
    make SASS="bundle exec sass" DESTDIR="${pkgdir}" install
    cd "${pkgdir}"/usr/share/themes
    mv Numix 'Numix Electric'
}
