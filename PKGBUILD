# Maintainer: mazix <mazix@bk.ru>
pkgname=perplexity
pkgver='1.1.3.13'
pkgrel=1
pkgdesc="Native Perplexity AI client for Linux (Electron wrapper)"
arch=('x86_64')
license=('Apache 2.0')
depends=('electron')
makedepends=('npm' 'nodejs')

# These files are expected to be in the same directory as the PKGBUILD
source=("launcher.sh"
        "perplexity.desktop"
        "perplexity.png"
        "default.conf")

sha256sums=('73a2a82540005d5c856efba8b01c04aff2f6a42bf890164e37da57691e662d2b'
            'cc0ccc05588907474681a197fd658135625426b0f7de6b5006e5ce06fc0257fd'
            '36ee4908a30561ee36454cc2319dbb636d6b0091c8ab46bc440ba25ce47a746c'
            '0926f58bd0adad27d8cda90feb401cf83350b6d37098d481178bb211cb34e95c')

prepare() {
    # Copy source files from the repository root
    mkdir -p "${srcdir}/perplexity-${pkgver}"
    
    # Try different possible paths to find the src directory
    SRC_PATH=""
    if [ -d "${startdir}/../src" ]; then
        SRC_PATH="$(realpath "${startdir}/../src")"
    elif [ -d "${startdir}/../../src" ]; then
        SRC_PATH="$(realpath "${startdir}/../../src")"
    elif [ -d "$(dirname "${startdir}")/src" ]; then
        SRC_PATH="$(realpath "$(dirname "${startdir}")/src")"
    elif [ -d "$(pwd)/../src" ]; then
        SRC_PATH="$(realpath "$(pwd)/../src")"
    fi
    
    if [ -n "${SRC_PATH}" ] && [ -d "${SRC_PATH}" ]; then
        echo "Found src directory at: ${SRC_PATH}"
        TARGET_PATH="$(realpath "${srcdir}/perplexity-${pkgver}")"
        echo "Target directory: ${TARGET_PATH}"
        
        # Check if there's already a perplexity-${pkgver} directory in src
        if [ -d "${SRC_PATH}/perplexity-${pkgver}" ]; then
            echo "Found existing perplexity-${pkgver} directory in src, copying its contents"
            # Check if directory has any content (including hidden files)
            if [ "$(ls -A "${SRC_PATH}/perplexity-${pkgver}" 2>/dev/null)" ]; then
                # Copy all contents including hidden files
                cp -r "${SRC_PATH}/perplexity-${pkgver}/".* "${TARGET_PATH}/" 2>/dev/null || true
                cp -r "${SRC_PATH}/perplexity-${pkgver}/"* "${TARGET_PATH}/" 2>/dev/null || true
            else
                echo "Warning: perplexity-${pkgver} directory is empty, copying all src contents instead"
                # Copy files one by one to avoid directory conflicts
                for item in "${SRC_PATH}/"*; do
                    if [ -e "$item" ] && [ "$(basename "$item")" != "perplexity-${pkgver}" ]; then
                        cp -r "$item" "${TARGET_PATH}/"
                    fi
                done
            fi
        else
            echo "Copying all src contents to target directory"
            # Avoid copying directory into itself by checking resolved paths
            if [ "${SRC_PATH}" != "${TARGET_PATH}" ]; then
                # Copy files one by one to avoid directory conflicts
                for item in "${SRC_PATH}/"*; do
                    if [ -e "$item" ]; then
                        cp -r "$item" "${TARGET_PATH}/"
                    fi
                done
            else
                echo "Error: Source and target directories are the same"
                echo "Source: ${SRC_PATH}"
                echo "Target: ${TARGET_PATH}"
                exit 1
            fi
        fi
        
        # Copy LICENSE file from various possible locations
        LICENSE_FOUND=false
        
        # Try multiple possible paths for LICENSE file
        LICENSE_PATHS=(
            "$(dirname "${SRC_PATH}")/LICENSE"
            "${startdir}/../LICENSE"
            "${startdir}/../../LICENSE"
            "$(dirname "${startdir}")/LICENSE"
            "$(pwd)/../LICENSE"
            "$(pwd)/../../LICENSE"
            "/build/LICENSE"
            "/build/src/../LICENSE"
        )
        
        echo "Searching for LICENSE file in multiple locations..."
        for license_path in "${LICENSE_PATHS[@]}"; do
            echo "Checking: ${license_path}"
            if [ -f "${license_path}" ]; then
                echo "Found LICENSE file at: ${license_path}"
                cp "${license_path}" "${TARGET_PATH}/"
                LICENSE_FOUND=true
                break
            fi
        done
        
        if [ "${LICENSE_FOUND}" = false ]; then
            echo "Warning: LICENSE file not found in any of the checked locations"
            echo "Creating a placeholder LICENSE file"
            echo "Apache License 2.0 - See project repository for full license text" > "${TARGET_PATH}/LICENSE"
        fi
    else
        echo "Error: Cannot find src directory"
        echo "Checked paths:"
        echo "  ${startdir}/../src"
        echo "  ${startdir}/../../src"
        echo "  $(dirname "${startdir}")/src"
        echo "  $(pwd)/../src"
        exit 1
    fi
    
    # Check if package.json exists in the target directory
    if [ -f "${srcdir}/perplexity-${pkgver}/package.json" ]; then
        cd "${srcdir}/perplexity-${pkgver}"
        npm install --production
    else
        echo "Warning: package.json not found in ${srcdir}/perplexity-${pkgver}"
        echo "Skipping npm install step"
    fi
}

build() {
    # No build steps needed, npm install is now in prepare()
    :
}

package() {
    # Install application files
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/perplexity-${pkgver}/." "${pkgdir}/usr/lib/${pkgname}/"

    # Install launcher script
    install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/perplexity.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icon
    install -Dm644 "${srcdir}/perplexity.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # Install config file
    install -Dm644 "${srcdir}/default.conf" "${pkgdir}/etc/${pkgname}/default.conf"

    # Install license
    install -Dm644 "${srcdir}/perplexity-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
