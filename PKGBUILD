# Maintainer: Xinc

# Thanks to unity-for-arch project for most of this code!

# Not every package is updated to the latest version. The versions of the
# older packages can be overridden here. Just add '<name>::<version>' to
# the array below and then create a new array named 'pkgs<name>' with the
# list of packages that should use the specific version.
override_vers=(
    '20220721::22.04+20220721'
    '20171012::17.10+20171012'
    '20141014::14.10+20141014'
    '20140909::14.10+20140909'
    '20180712::18.04+20180712'
    '20200702::18.04+20200702'
    '20160320::16.04+20160320'
    '20160214::16.04+20160214'
    '20181009::18.10+20181009'
    '20180731::18.10+20180731'
)

basever='22.10+20221013'

# Adding a language to the 'languages' array below will add the '<lang>',
# '<lang>-base', 'gnome-<lang>', 'gnome-<lang>-base', and 'touch-<lang>'
# packages. If one of those packages don't exist in Ubuntu, add it to the
# 'skip_pkgs' array below.

skip_pkgs=(
    touch-{af,am,an,ar,as,ast,az}
    touch-{be,bg,bn,bo,br,bs}
    touch-{ca,crh,cs,cy}
    touch-{da,de,dz}
    touch-{el,en,eo,es,et,eu}
    touch-{fa,fi,fr,fur}
    touch-{ga,gd,gl,gu}
    touch-{hi,he,hr,hu}
    touch-{ia,id,is,it}
    touch-ja
    touch-{ka,kk,km,kn,ko,ku}
    touch-{lt,lv}
    touch-{mai,mk,ml,mn,mr,ms,my}
    touch-{nb,nds,ne,nl,nn}
    touch-{oc,or}
    touch-{pa,pl,pt}
    touch-{ro,ru}
    touch-{si,sk,sl,sq,sr,sv}
    touch-{ta,te,tg,th,tr}
    touch-{ug,uk,uz}
    touch-vi
    touch-xh
    touch-{zh-hans,zh-hant}
)

translations=(
    gnome-screensaver
    indicator-appmenu
    indicator-bluetooth
    indicator-datetime
    indicator-keyboard
    indicator-messages
    indicator-power
    indicator-printers
    indicator-session
    indicator-sound
    #nautilus
    nm-applet
    telepathy-indicator
    unity
    unity-control-center
    unity-greeter
    unity-lens-applications
    unity-lens-files
    unity-lens-music
    unity-lens-photos
    unity-lens-video
    unity-scope-home
    unity-settings-daemon
)

pkgs20220721=(
    am language-pack-am
    am-base language-pack-am-base
    gnome-am language-pack-gnome-am
    gnome-am-base language-pack-gnome-am-base
)

pkgs20171012=(
    az language-pack-az
    az-base language-pack-az-base
    gnome-az language-pack-gnome-az
    gnome-az-base language-pack-gnome-az-base
    nds language-pack-nds
    nds-base language-pack-nds-base
    gnome-nds language-pack-gnome-nds
    gnome-nds-base language-pack-gnome-nds-base
    xh language-pack-xh
    xh-base language-pack-xh-base
    gnome-xh language-pack-gnome-xh
    gnome-xh-base language-pack-gnome-xh-base
)

pkgs20141014=(
    bo language-pack-bo
    gnome-bo language-pack-gnome-bo
)

pkgs20140909=(
    bo-base language-pack-bo-base
    gnome-bo-base language-pack-gnome-bo-base
)

pkgs20180712=(
    mai language-pack-mai
    mai-base language-pack-mai-base
    gnome-mai-base language-pack-gnome-mai-base
)

pkgs20200702=(
    gnome-mai language-pack-gnome-mai
)

pkgs20160320=(
    mn language-pack-mn
    gnome-mn language-pack-gnome-mn
    uz language-pack-uz
    gnome-uz language-pack-gnome-uz
)

pkgs20160214=(
    mn-base language-pack-mn-base
    gnome-mn-base language-pack-gnome-mn-base
    uz-base language-pack-uz-base
    gnome-uz-base language-pack-gnome-uz-base
)

pkgs20181009=(
    si language-pack-si
    gnome-si language-pack-gnome-si
)

pkgs20180731=(
    si-base language-pack-si-base
    gnome-si-base language-pack-gnome-si-base
)

setver() {
    local name=${1}
    local var=${name//-/_}
    local ver=${2}

    declare -g "_ver_${var}=${2}"
    packages+=("${name}")
    if [[ "${ver}" =~ [17.10]+ ]]; then
        declare -g "_ext_${var}=xz"
    fi
    if [[ "${ver}" =~ 14.10* ]]; then
        declare -g "_ext_${var}=gz"
    fi
    if [[ "${ver}" =~ 16.04* ]]; then
        declare -g "_ext_${var}=gz"
    fi

}

languages=(
    af am an ar as ast az
    be bg bn bo br bs
    ca crh cs cy
    da de dz
    el en eo es et eu
    fa fi fr fur
    ga gd gl gu
    he hi hr hu
    ia id is it
    ja
    ka kk km kn ko ku
    lt lv
    mai mk ml mn mr ms my
    nb nds ne nl nn
    oc or
    pa pl pt
    ro ru
    si sk sl sq sr sv
    ta te tg th tr
    ug uk uz
    vi
    xh
    zh-hans zh-hant
)

# Copied from /usr/bin/makepkg
if ! type -t in_array >/dev/null; then
    in_array() {
        local needle=$1; shift
        local item
        for item in "$@"; do
            [[ $item = "$needle" ]] && return 0 # Found
        done
        return 1 # Not Found
    }
fi

for lang in "${languages[@]}"; do
    lang_ver=${basever}
    lang_base_ver=${basever}
    gnome_lang_ver=${basever}
    gnome_lang_base_ver=${basever}
    touch_lang_ver=${basever}

    for override_ver in "${override_vers[@]}"; do
        name="${override_ver%::*}"
        version="${override_ver#*::}"
        pkgs_ref="pkgs${name}[@]"

        for i in "${!pkgs_ref}"; do
            if [[ "${lang}" == "${i}" ]]; then
                lang_ver=${version}
            elif [[ "${lang}-base" == "${i}" ]]; then
                lang_base_ver=${version}
            elif [[ "gnome-${lang}" == "${i}" ]]; then
                gnome_lang_ver=${version}
            elif [[ "gnome-${lang}-base" == "${i}" ]]; then
                gnome_lang_base_ver=${version}
            elif [[ "touch-${lang}" == "${i}" ]]; then
                touch_lang_ver=${version}
            fi
        done
    done

    if ! in_array "${lang}" "${skip_pkgs[@]}"; then
        setver "${lang}" "${lang_ver}"
    fi
    if ! in_array "${lang}-base" "${skip_pkgs[@]}"; then
        setver "${lang}-base" "${lang_base_ver}"
    fi
    if ! in_array "gnome-${lang}" "${skip_pkgs[@]}"; then
        setver "gnome-${lang}" "${gnome_lang_ver}"
    fi
    if ! in_array "gnome-${lang}-base" "${skip_pkgs[@]}"; then
        setver "gnome-${lang}-base" "${gnome_lang_base_ver}"
    fi
    if ! in_array "touch-${lang}" "${skip_pkgs[@]}"; then
        setver "touch-${lang}" "${touch_lang_ver}"
    fi
done

pkgname=unity-language-pack
pkgver=22.10
pkgrel=1
pkgdesc="Ubuntu's Unity-related translations"
arch=(any)
url="https://translations.launchpad.net/ubuntu"
license=(GPL)

source=()
for i in "${packages[@]}"; do
    _name=${i}
    _var=${_name//-/_}
    _ver_ref=_ver_${_var}
    _ext_ref=_ext_${_var}

    # Launchpad's redirection is too slow
    #source+=("https://launchpad.net/ubuntu/+archive/primary/+files/language-pack-${_name}_${_ver}.tar.gz")
    source+=("http://archive.ubuntu.com/ubuntu/pool/main/l/language-pack-${_name}/language-pack-${_name}_${!_ver_ref}.tar.${!_ext_ref}")
done

package() {
    # Ubuntu Desktop -> Arch Linux Desktop
    find . -name unity.po -exec sed -i \
        -e '/msgid "Ubuntu Desktop"/ {n;s/Ubuntu/Arch Linux/}' \
        -e 's/Ubuntu Desktop/Arch Linux Desktop/g' \
        {} \+

    for i in "${translations[@]}"; do
        while read -r src; do
            lang=$(cut -d/ -f 4 <<< "${src}")
            dir="${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES"
            target="${dir}/$(basename "${src}" | sed 's/\.po$/.mo/')"
            install -dm755 "${dir}"
            msgfmt "${src}" -o "${target}"
        done < <(find . -name "${i}.po")
    done
}
sha512sums=('SKIP')

