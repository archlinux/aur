# Maintainer: ponelou <dev.ponleousk@gmail.com>

_libadwaita_support=1

pkgname=darkly-gtk-git
pkgver=r17.cc2d8bb
pkgrel=1
pkgdesc="Darkly GTK theme"
arch=('any')
url="https://github.com/wrymt/darkly-gtk"
license=('LGPL2.1')
depends=()
makedepends=('git' 'sassc')
conflicts=('darkly-gtk')
source=("${pkgname}::git+https://github.com/wrymt/darkly-gtk.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "$pkgname"

    if [ -n "$XDG_CONFIG_HOME" ]; then
        DARKLYRC="$XDG_CONFIG_HOME/darklyrc"
    else
        DARKLYRC="$HOME/.config/darklyrc"
    fi

    if [ -f "$DARKLYRC" ]; then
        awk '
            function trim(s) { gsub(/^[ \t]+|[ \t]+$/, "", s); return s }

            /^\[(Common|Style|Windeco)\]/ { keep=1; next }
            /^\[/ { keep=0 }

            keep && /^[^=]+=.*$/ {
                split($0, a, "=")
                key = trim(a[1])
                val = trim(a[2])

                if (val ~ /^[0-9]+,[ \t]*[0-9]+,[ \t]*[0-9]+$/) {
                    split(val, rgb, ",")
                    val = sprintf("rgb(%s, %s, %s)", rgb[1], rgb[2], rgb[3])
                }

                printf("$Darklyrc%s: %s;\n", key, val)
            }
            ' "$DARKLYRC" | tee sass/_darkly_user_settings.scss
    else
        echo "" > sass/_darkly_user_settings.scss
    fi

    mkdir -p build
    SASSC_OPT="-M -t compact"
    sassc $SASSC_OPT sass/gtk3-light.scss build/gtk3-light.css
    sassc $SASSC_OPT sass/gtk3-dark.scss build/gtk3-dark.css
    sassc $SASSC_OPT sass/gtk4.scss build/gtk4.css

    # the theme uses a darkly-gtk-assets symlink to ../assets
    # this replaces the path instead of relying on the symlink
    sed -i 's#darkly-gtk-assets#../assets#g' build/gtk3-light.css
    sed -i 's#darkly-gtk-assets#../assets#g' build/gtk3-dark.css
    sed -i 's#darkly-gtk-assets#../assets#g' build/gtk4.css
}

package() {
    cd "$pkgname"

    install -d "$pkgdir/usr/share/themes/Darkly"
    install -d "$pkgdir/usr/share/themes/Darkly/assets"
    cp -r assets/*.png assets/*.svg "$pkgdir/usr/share/themes/Darkly/assets/"

    install -d "$pkgdir/usr/share/themes/Darkly/gtk-3.0"
    cp build/gtk3-light.css "$pkgdir/usr/share/themes/Darkly/gtk-3.0/gtk.css"
    cp build/gtk3-dark.css "$pkgdir/usr/share/themes/Darkly/gtk-3.0/gtk-dark.css"

    install -d "$pkgdir/usr/share/themes/Darkly/gtk-4.0"

    if [[ $_libadwaita_support -eq 1 ]]; then
        cp build/gtk4.css "$pkgdir/usr/share/themes/Darkly/gtk-4.0/gtk-dark.css"
        echo -n $'@import \'gtk-dark.css\';\n@import \'colors.css\';' > "$pkgdir/usr/share/themes/Darkly/gtk-4.0/gtk.css"
    else
        cp build/gtk4.css "$pkgdir/usr/share/themes/Darkly/gtk-4.0/gtk-dark.css"
        ln -fs ./gtk-dark.css "$pkgdir/usr/share/themes/Darkly/gtk-4.0/gtk.css"
    fi
}
