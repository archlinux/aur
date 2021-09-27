# Maintainer: Spacingbat3 <git@spacingbat3.anonaddy.com> (https://github.com/spacingbat3)
pkgname=webcord-git
pkgver=2.0.0_beta2.r248.dd785a7
pkgrel=1
pkgdesc="A Discord client based on the Electron engine."
arch=("any")

_repo="WebCord"
_author="SpacingBat3"

url="https://github.com/${_author}/${_repo}"
license=('MIT')
makedepends=('npm' 'git' 'imagemagick' 'typescript' 'jq')
depends=('electron')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/${_author}/${_repo}.git"
        "${pkgname%-git}.desktop")
md5sums=('SKIP'
         '85d234a65c69f3cf817fac5c54c194c8')

_TIMES='1'
_TIMES_MAX='6'

_echo_times() {
    echo "(${_TIMES}/${_TIMES_MAX})" "${@}"
    let _TIMES++
}

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s.r%s.%s" "$(jq -r .version "${srcdir}/${pkgname%-git}/package.json" | tr '-' '_')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_make_sources_ready() {
    _print() {
        printf "\r%-${1}s" "${2}"
    }

    _icons=("${srcdir}/${pkgname%-git}/sources/assets/icons/app.png")
    _terminal() {
        echo -ne "#!/bin/bash\n\$(printf '%s\\\\n' /usr/bin/electron* | sort --reverse | head -n1) /usr/lib/${pkgname%-git}.asar\nexit \$?">"$1"
    }
    cd "${srcdir}/${pkgname%-git}"

    # Clean workspace and remove unnecesary files:

    _echo_times "Clean-up workspace..."

    _PACKAGE_IGNORE=("../${pkgname%-git}.asar" "../iconThemes" "sources/assets/icons/app.ico"
                    "sources/assets/icons/app.icns" "sources/app/configForge.js" "sources/code/configForge.ts"
                    ".gitignore" ".eslintrc.json" "../docs" "build" ".github" "../extra")

    for _target in "${_PACKAGE_IGNORE[@]}"; do
        if [[ -f "${_target}" ]]; then
            rm "${_target}"
        elif [[ -d "${_target}" ]]; then
            rm -R "${_target}"
        fi
    done

    # Temporarily move '.git' outside the sources (if exists)
    [[ -d .git ]] && mv .git ../git-data

    # Compile TypeScript to JavaScript
    _echo_times "Compiling TypeScript to Javascript..."
    tsc || { echo "Failed to compile TypeScript sources to JavaScript"; exit 1; }

    # Cleanup – reinstall dependencies
    _echo_times "Removing build dependencies..."
    npm uninstall --save-prod --only=prod "${_remove[@]}"
    rmdir node_modules/* --ignore-fail-on-non-empty

    # Package to ASAR
    _echo_times "Packaging app to ASAR archive..."
    npx asar pack . ../${pkgname%-git}.asar || { echo "Failed to package to ASAR!"; exit 2; }

    _terminal "../${pkgname%-git}.sh"

    [[ -d ../git-data ]] && mv ../git-data .git

    # Generate icons:

    mkdir "../iconThemes"
    cd "../iconThemes"
    _sizes=(512 256 128 96 64 48 32 24 22 18 16 8)
    _i=1
    mkdir "themeId-${_i}"
    _echo_times "Generating icons in different sizes..."
    for _file in "${_icons[@]}"; do
        [[ $(file "${_file}") =~ "PNG" ]] && _ext="png"
        for _size in "${_sizes[@]}"; do
            [[ ! -z "${_msg}" ]] && _old_msg="${#_msg}" || _old_msg=0
            _msg="Generating images: F=`basename "${_file}"`; S=${_size}x${_size}"
            _print "${_old_msg}" "${_msg}"
            _out="themeId-${_i}/${_size}x${_size}/apps/${pkgname%-git}.${_ext}"
            mkdir -p "$(dirname "$_out")"
            if [[ "${_ext}" == "png" ]]; then
                convert "$_file" -size "${_size}x${_size}" "$_out"
            else
                echo -e "\nERROR: Unknown image type!"
                exit 3
            fi
        done
        let _i++
    done
    _print "${#_msg}" && printf '\r'
}

build() {
	cd "${srcdir}/${pkgname%-git}"
    # TSC definitions – as of Electron, 'global' or "latest"
    #   fallback version will be used:
    _types=(
    	$(jq .devDependencies "${srcdir}/${pkgname%-git}/package.json"| grep @types/ | tr -d '{}"' | sed s~:.*\~~g | tr -d ' ' | tr '\n' ' ')
    	$(jq .devDependencies "${srcdir}/${pkgname%-git}/package.json" | grep @electron-forge/ | tr -d '{}"' | sed s~:.*\~~g | tr -d ' ' | tr '\n' ' ')
        "electron@`{ "$(printf '%s\\\\n' /usr/bin/electron* | sort --reverse | head -n1)" -v | cut -c 2-; } || printf "latest"`"
    )
    _remove=("${_types[@]}" 'electron') # electron@[VERSION] is ignored
    # Install production dependencies only + some required types for 'tsc'
    _echo_times "Installing dependencies..."
    npm install --save-prod --only=prod "${_types[@]}"
    
    # Generate ASAR package and compile app for TSC format.
    _make_sources_ready
}

package() {
    cd "${srcdir}"

    # Neccesary files – application data, license etc.

    install -Dm755 "${pkgname%-git}.asar" "${pkgdir}/usr/lib/${pkgname%-git}.asar"
    install -Dm755 "${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/COPYING"

    # Application icons

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -R "iconThemes/themeId-1/" "${pkgdir}/usr/share/icons/hicolor"
    chmod 0644 "${pkgdir}/usr/share/icons"/*/*/*/"${pkgname%-git}."*

    # Documentation

    install -dm755 "${pkgdir}/usr/share/docs"
    cp -R "${pkgname%-git}/docs/" "${pkgdir}/usr/share/docs/${pkgname%-git}/"
    chmod 0644 "${pkgdir}/usr/share/docs/${pkgname%-git}/"

    # Make package valid for current major version only
    # (to force users to rebuild it on Electron update)
    _e="$(electron -v --no-sandbox | sed 's~v~~g;s~\..*~~g')"
    [[ ! -z "${_e}" ]] && depends=("electron>=${_e}.0.0" "electron<$[_e+1].0.0")
}
