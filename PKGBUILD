# Maintainer: Jonas Verhofsté <jonas@verhofste.tech>

pgkbase='lavanda-gtk-theme-git'
_pkgbase='lavanda-gtk-theme'
pkgname=('lavanda-gtk-theme-git' 'lavanda-compact-gtk-theme-git' 'lavanda-sea-gtk-theme-git' 'lavanda-sea-compact-gtk-theme-git')
pkgver='2024.04.28.r16.g9e6517b'
pkgrel=2
pkgdesc="Lavanda theme for GNOME/GTK based desktop environments"
url="https://github.com/vinceliuice/Lavanda-gtk-theme"
arch=('any')
license=('GPL-3.0')
makedepends=('sassc' 'gettext')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-extra: for gtk2 themes')
source=("${_pkgbase}::git+${url}.git" 'index.theme')
sha256sums=('SKIP' 'a3b3efa0081ff53d1ee8ad8158c737bd2d7107d9696e138defb7bfd352777f8b')
options=('!strip' '!debug')

_colour_variants=('' '-Light' '-Dark')
# Change this if you want a smaller package
_gtk_variants=('gnome-shell' 'gtk-2.0' 'gtk-3.0' 'gtk-4.0' 'cinnamon' 'metacity' 'xfwm' 'xfwm-hdpi' 'xfwm-xhdpi' 'plank')

_gnome_widgets_version='48-0'
_gnome_extensions_version='46-0'

_sass_opts=('--omit-map-comment' '--style expanded')

pkgver() {
  cd "${_pkgbase}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgbase}/src"

  # Converted from various functions in the upstream install script
  cp -f 'sass/gnome-shell/_common.scss' 'sass/gnome-shell/_common-temp.scss'
  sed -i "/\widgets/s/40-0/${_gnome_widgets_version}/" 'sass/gnome-shell/_common-temp.scss'
  sed -i "/\extensions/s/40-0/${_gnome_extensions_version}/" 'sass/gnome-shell/_common-temp.scss'
}

_build() {
  local variant="${1}"

  for colour in "${_colour_variants[@]}"; do
    export _THEME_NAME="Lavanda${variant}${colour}"
    local _pkgdir="${pkgdir}/usr/share/themes/${_THEME_NAME}"

    install -D -d "${_pkgdir}"
    envsubst '${_THEME_NAME}' < "${srcdir}/index.theme" > "${_pkgdir}/index.theme"

    cd "${srcdir}/${_pkgbase}/src"

    if [[ "${_gtk_variants[*]}" == *'gnome-shell'* ]]; then
      install -d -m '0755' "${_pkgdir}/gnome-shell"
      install -T -m '0644' "main/gnome-shell/pad-osd.css" "${_pkgdir}/gnome-shell/pad-osd.css"
      install -D -m '0644' -t "${_pkgdir}/gnome-shell/assets" "assets/gnome-shell/common-assets"/*
      install -D -m '0644' -t "${_pkgdir}/gnome-shell/assets" "assets/gnome-shell/assets${colour#'-Light'}"/*
      install -D -m '0644' -t "${_pkgdir}/gnome-shell/assets" "assets/gnome-shell/theme-assets${variant%'-Compact'}"/*
      install -D -m '0644' -T "assets/gnome-shell/activities${colour#'-Light'}/activities-arch.svg" "${_pkgdir}/gnome-shell/assets/activities.svg"
      install -D -m '0644' -T "assets/gnome-shell/activities-Dark/activities-arch.svg" "${_pkgdir}/gnome-shell/assets/activities-white.svg"
      sassc ${_sass_opts[@]} "main/gnome-shell/gnome-shell${variant%'-Compact'}${colour}.scss" "${_pkgdir}/gnome-shell/gnome-shell.css"
    fi

    if [[ "${_gtk_variants[*]}" == *'gtk-2.0'* ]]; then
      install -d -m '0755' "${_pkgdir}/gtk-2.0"
      install -D -m '0644' -T "main/gtk-2.0/gtkrc${variant%'-Compact'}${colour#'-Light'}" "${_pkgdir}/gtk-2.0/gtkrc"
      install -D -m '0644' -t "${_pkgdir}/gtk-2.0" "main/gtk-2.0/common"/*.rc
      install -D -m '0644' -t "${_pkgdir}/gtk-2.0/assets" "assets/gtk-2.0/assets-common${colour#'-Light'}"/*
      install -D -m '0644' -t "${_pkgdir}/gtk-2.0/assets" "assets/gtk-2.0/assets${variant%'-Compact'}"/*
    fi

    for gtk in 'gtk-3.0' 'gtk-4.0'; do
      if [[ "${_gtk_variants[*]}" == *"${gtk}"* ]]; then
        install -d -m '0755' "${_pkgdir}/${gtk}"
        install -D -m '0644' -t "${_pkgdir}/${gtk}/assets" "assets/gtk/assets${variant%'-Compact'}"/*
        install -D -m '0644' -t "${_pkgdir}/${gtk}/assets/scalable" "assets/gtk/scalable"/*
        install -D -m '0644' -T "assets/gtk/thumbnails/thumbnail${variant%'-Compact'}${colour#'-Light'}.png" "${_pkgdir}/${gtk}/thumbnail.png"
        sassc ${_sass_opts[@]} "main/${gtk}/gtk${variant%'-Compact'}${colour}.scss" "${_pkgdir}/${gtk}/gtk.css"
        sassc ${_sass_opts[@]} "main/${gtk}/gtk${variant%'-Compact'}-Dark.scss" "${_pkgdir}/${gtk}/gtk-dark.css"
      fi
    done

    if [[ "${_gtk_variants[*]}" == *'cinnamon'* ]]; then
      install -d -m '0755' "${_pkgdir}/cinnamon"
      install -D -m '0644' -t "${_pkgdir}/cinnamon/assets" 'assets/cinnamon/common-assets'/*
      install -D -m '0644' -t "${_pkgdir}/cinnamon/assets" "assets/cinnamon/assets${colour#'-Light'}"/*
      install -D -m '0644' -t "${_pkgdir}/cinnamon/assets" "assets/cinnamon/theme-assets${variant%'-Compact'}"/*
      install -D -m '0644' -T "assets/cinnamon/thumbnails/thumbnail${variant%'-Compact'}${colour}.png" "${_pkgdir}/cinnamon/thumbnail.png"
      sassc ${_sass_opts[@]} "main/cinnamon/cinnamon${variant%'-Compact'}${colour}.scss" "${_pkgdir}/cinnamon/cinnamon.css"
    fi

    if [[ "${_gtk_variants[*]}" == *'metacity'* ]]; then
      install -d -m '0755' "${_pkgdir}/metacity-1"
      install -D -m '0644' -T 'main/metacity-1/metacity-theme-3.xml' "${_pkgdir}/metacity-1/metacity-theme-3.xml"
      ln -srT "${_pkgdir}/metacity-1/metacity-theme-3.xml" "${_pkgdir}/metacity-1/metacity-theme-1.xml"
      ln -srT "${_pkgdir}/metacity-1/metacity-theme-3.xml" "${_pkgdir}/metacity-1/metacity-theme-2.xml"
      install -D -m '0644' -t "${_pkgdir}/metacity-1/assets" 'assets/metacity-1/assets'/*
      install -D -m '0644' -T "assets/metacity-1/thumbnail${colour#'-Light'}.png" "${_pkgdir}/metacity-1/thumbnail.png"
    fi

    for xfwm in '' '-hdpi' '-xhdpi'; do
      if [[ "${_gtk_variants[*]}" == *"xfwm${xfwm}"* ]]; then
        install -d -m '0755' "${_pkgdir}${xfwm}/xfwm4"
        install -D -m '0644' -t "${_pkgdir}${xfwm}/xfwm4" "assets/xfwm4/assets${variant%'-Compact'}${colour#'-Dark'}${xfwm}"/*
        install -D -m '0644' -T "main/xfwm4/themerc${colour#'-Dark'}" "${_pkgdir}${xfwm}/xfwm4/themerc"
        if [ "${xfwm}" = '-hdpi' ]; then
          sed -i 's/button_offset=6/button_offset=9/' "${_pkgdir}${xfwm}/xfwm4/themerc"
        elif [ "${xfwm}" = '-xhdpi' ]; then
          sed -i 's/button_offset=6/button_offset=12/' "${_pkgdir}${xfwm}/xfwm4/themerc"
        fi
      fi
    done

    if [[ "${_gtk_variants[*]}" == *'plank'* ]]; then
      install -d -m '0755' "${_pkgdir}/plank"
      install -D -m '0644' -t "${_pkgdir}/plank" "main/plank/theme${colour:--Light}"/*
    fi
  done
}

package_lavanda-gtk-theme-git() {
  echo "\$compact: 'false';" > "${srcdir}/${_pkgbase}/src/sass/_options-temp.scss"
  echo "\$compact: 'false';" > "${srcdir}/${_pkgbase}/src/sass/gnome-shell/_options-temp.scss"

  _build ''
}

package_lavanda-compact-gtk-theme-git() {
  pkgdesc="Lavanda theme for GNOME/GTK based desktop environments (compact version)"

  echo "\$compact: 'true';" > "${srcdir}/${_pkgbase}/src/sass/_options-temp.scss"
  echo "\$compact: 'true';" > "${srcdir}/${_pkgbase}/src/sass/gnome-shell/_options-temp.scss"

  _build '-Compact'
}

package_lavanda-sea-gtk-theme-git() {
  pkgdesc="Lavanda Sea theme for GNOME/GTK based desktop environments"

  echo "\$compact: 'false';" > "${srcdir}/${_pkgbase}/src/sass/_options-temp.scss"
  echo "\$compact: 'false';" > "${srcdir}/${_pkgbase}/src/sass/gnome-shell/_options-temp.scss"

  _build '-Sea'
}

package_lavanda-sea-compact-gtk-theme-git() {
  pkgdesc="Lavanda Sea theme for GNOME/GTK based desktop environments (compact version)"

  echo "\$compact: 'true';" > "${srcdir}/${_pkgbase}/src/sass/_options-temp.scss"
  echo "\$compact: 'true';" > "${srcdir}/${_pkgbase}/src/sass/gnome-shell/_options-temp.scss"

  _build '-Sea-Compact'
}
