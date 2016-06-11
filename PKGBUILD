pkgname=numix-themes-electric
pkgver=2.5.1
pkgrel=2
pkgdesc='A flat and light theme with a modern look using Arch Linux colors (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
source=("numix-themes-${pkgver}.tar.gz::https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")
md5sums=('f480ae44848186818a4c5a884c250388')

prepare() {
    names='base_color bg_color text_color fg_color selected_bg_color selected_fg_color tooltip_bg_color tooltip_fg_color'
    
    cd numix-gtk-theme-${pkgver}
    
    for name in $names
    do
        color=$(grep "@define-color\\s\+$name" gtk-3.0/gtk-dark.css | head -n1 | cut -d' ' -f3 | cut -d';' -f1)
        sed -i "s/$name:#.\{6\}/$name:$color/" gtk-2.0/gtkrc
    done
    
    sed -i 's/selected_bg_color:#.\{6\}/selected_bg_color:#00BFFF/' gtk-2.0/gtkrc
    sed -i 's/selected_fg_color:#.\{6\}/selected_fg_color:#000000/' gtk-2.0/gtkrc
    sed -i 's/@define-color selected_bg_color #.\{6\}/@define-color selected_bg_color #00BFFF/' gtk-3.0/gtk-dark.css
    sed -i 's/@define-color selected_fg_color #.\{6\}/@define-color selected_fg_color #000000/' gtk-3.0/gtk-dark.css
    
    cd gtk-3.0
    
    rm -f gtk.css
    mv gtk-dark.css gtk.css
}

package() {
    cd numix-gtk-theme-${pkgver}
    
    install -dm 755 "${pkgdir}"/usr/share/themes/Numix-Electric
    rm -rf .git .gitignore CREDITS LICENSE README.md
    cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-Electric/
}
