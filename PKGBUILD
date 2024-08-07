# Maintainer: billli11

pkgname=reshade-shaders-git
pkgver=r81.fe1771a
pkgrel=1
pkgdesc='A collection of post-processing shaders written in the ReShade FX shader language, to be used by vkBasalt'
arch=('any')
url='https://github.com/crosire/reshade-shaders'
license=('custom')
makedepends=('git' 'curl' 'libarchive')
source=("git+https://github.com/crosire/reshade-shaders.git#branch=list")
sha256sums=(SKIP)
install=reshade-shaders.install

pkgver() {
  cd "reshade-shaders"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local -A ini_array
    local -a effect_lists
    local line effect license shaders textures

    [ -d "${srcdir}/build" ] && rm -r "${srcdir}/build"
    mkdir -p "${srcdir}/build/"{shaders,textures,extract}
    cd "${srcdir}/build"

    { read -r
    while read -r line; do
        case "$line" in
        "["*"]")
            # Set fallback name if empty
            ini_array[name]="${ini_array[name]:-${ini_array[url]##*/}}"
            ini_array[shaders]="${ini_array[shaders]:-shaders}"
            ini_array[textures]="${ini_array[textures]:-textures}"

            msg "Getting ${ini_array[name]}"
            mkdir -p "extract/${ini_array[name]}" "${ini_array[shaders]}" "${ini_array[textures]}"

            (   cd "extract/${ini_array[name]}"
                if ! /usr/bin/curl -L "${ini_array[url]}" -o "${ini_array[name]}.zip"; then
                    msg "Failed to download ${ini_array[url]}"
                    exit 1
                fi
                if ! /usr/bin/bsdunzip "${ini_array[name]}.zip"; then
                    msg "Failed to extract ${ini_array[name]}.zip"
                    exit 1
                fi

                shaders="$(find . -mindepth 1 -type d -iname 'shaders'|head -n 1)"
                [ -d "$shaders" ] && mv "$shaders/"* -t "../../${ini_array[shaders]}"

                while read -d '' -r license; do
                    mv "$license" -t "../../${ini_array[shaders]}"
                done < <(find . -type f -iregex '.*/\(license.*\|.*\.md\)' -print0)

                textures="$(find . -mindepth 1 -type d -iname 'textures'|head -n 1)"
                [ -d "$textures" ] && mv "$textures/"* -t "../../${ini_array[textures]}"

                msg done
            )
            unset "ini_array[name]" "ini_array[shaders]" "ini_array[textures]" "ini_array[url]";;
        "PackageName="*)
            ini_array[name]="${line#PackageName=}";;
        "InstallPath="*)
            ini_array[shaders]="${line#*reshade-shaders\\}"
            ini_array[shaders]="${ini_array[shaders],S}"
            ini_array[shaders]="${ini_array[shaders]//\\/\/}";;
        "TextureInstallPath="*)
            ini_array[textures]="${line#*reshade-shaders\\}"
            ini_array[textures]="${ini_array[textures],T}"
            ini_array[textures]="${ini_array[textures]//\\/\/}";;
        "DownloadUrl="*)
            ini_array[url]="${line#DownloadUrl=}";;
        esac
    done
    } < <(cat ../reshade-shaders/EffectPackages.ini <(echo '[end]'))
}

package() {
    local file
    cd "${srcdir}/build"

    install -dm 755 "${pkgdir}/opt/reshade/shaders"
    install -dm 755 "${pkgdir}/opt/reshade/textures"
    while read -d '' -r file; do
        install -Dm 644 "$file" "${pkgdir}/opt/reshade/${file}"
    done < <(find "shaders" "textures" -type f -print0)
}
