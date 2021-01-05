pkgname=cherry-kde-theme
pkgver=1.3.r3.g1cc6fb8
pkgrel=1
pkgdesc="Clean, Flat, Fervent Tempo battlesuit-inspired Theme for Plasma Desktop"
arch=('any')
url="https://github.com/nullxception/cherry-kde-theme"
license=('GPL3')
optdepends=('konsole: For the Konsole color scheme'
            'kvantum-qt5: For the Qt application style')
makedepends=('git')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
options=(!strip)
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    THEME_NAME=cherry
    SRC="${srcdir}/${pkgname%-*}"
    PREFIX="${pkgdir}/usr"


    # Destination directory
    AURORAE="$PREFIX/share/aurorae/themes"
    KONSOLE="$PREFIX/share/konsole"
    KVANTUM="$PREFIX/share/Kvantum"
    LOOKFEEL="$PREFIX/share/plasma/look-and-feel"
    PLASMA="$PREFIX/share/plasma/desktoptheme"
    SCHEMES="$PREFIX/share/color-schemes"
    WALLPAPER="$PREFIX/share/wallpapers"

    [[ ! -d ${AURORAE} ]] && mkdir -p ${AURORAE}
    [[ ! -d ${KVANTUM} ]] && mkdir -p ${KVANTUM}
    [[ ! -d ${KONSOLE} ]] && mkdir -p ${KONSOLE}
    [[ ! -d ${LOOKFEEL} ]] && mkdir -p ${LOOKFEEL}
    [[ ! -d ${PLASMA} ]] && mkdir -p ${PLASMA}
    [[ ! -d ${SCHEMES} ]] && mkdir -p ${SCHEMES}
    [[ ! -d ${WALLPAPER} ]] && mkdir -p ${WALLPAPER}

    in_aurorae() {
        local name=${1}
        local variants=("solid"
        "square"
        "square-solid")

        cp -r ${SRC}/aurorae/${name} -t ${AURORAE}

        for variant in "${variants[@]}"; do
            cp -r ${SRC}/aurorae/${name}-${variant} -t ${AURORAE}
        done
    }

    in_kvantum() {
        local name=${1}
        local variants=("solid")

        cp -r ${SRC}/kvantum/${name} -t ${KVANTUM}

        for variant in "${variants[@]}"; do
            cp -r ${SRC}/kvantum/${name}-${variant} -t ${KVANTUM}
        done
    }

    in_plasma() {
        local name=${1}
        local variants=("solid")

        cp -r ${SRC}/plasma/desktoptheme/${name} -t ${PLASMA}
        mkdir ${PLASMA}/${name}/colors
        cp ${SRC}/color-schemes/${name}.colors -t ${PLASMA}/${name}/colors

        for variant in "${variants[@]}"; do
            cp -r ${SRC}/plasma/desktoptheme/${name}-${variant} -t ${PLASMA}

            if [[ -f ${SRC}/color-schemes/${name}-${variant}.colors ]]; then
                cp ${SRC}/color-schemes/${name}-${variant}.colors -t ${PLASMA}/${name}/colors
            fi
        done
    }

    in_global() {
        local name=${1}
        local domain=com.github.nullxception

        cp -r ${SRC}/plasma/look-and-feel/${domain}.${name} -t ${LOOKFEEL}
    }

    in_colors() {
        local name=${1}

        cp ${SRC}/color-schemes/${name}.colors -t ${SCHEMES}
        cp ${SRC}/konsole/${name}.colorscheme -t ${KONSOLE}
    }

    in_wallpaper() {
        local name=${1}

        cp -r ${SRC}/wallpaper/${name} -t ${WALLPAPER}
    }

    echo "Installing ${THEME_NAME}"
    in_aurorae    "${THEME_NAME}"
    in_colors     "${THEME_NAME}"
    in_global     "${THEME_NAME}"
    in_kvantum    "${THEME_NAME}"
    in_plasma     "${THEME_NAME}"
    in_wallpaper  "${THEME_NAME}"
}
