pkgname=gsd-pi
pkgver=2.77.0
pkgrel=1
pkgdesc="A powerful meta-prompting, context engineering and spec-driven development system that enables agents to work autonomously"
arch=(any)
url="https://github.com/gsd-build/gsd-2"
license=(MIT)




makedepends=( jq)



depends=(nodejs npm)

options=()



provides=(gsd gsd-cli)



_npm_name="gsd-pi"
source=("https://registry.npmjs.org/gsd-pi/-/gsd-pi-2.77.0.tgz")
sha256sums=('8dd7398dc7a51e0b95031b39e0ef0b8fc4977a5e1aeaf899abae6408e603628d')
noextract=("${_npm_name}-${pkgver}.tgz")

prepare() {
    mkdir -p "${srcdir}/npm_pkg"
    cd "${srcdir}/npm_pkg"
    tar -xzf "../${_npm_name}-${pkgver}.tgz"
}

package() {
    cd "${srcdir}/npm_pkg/package"

    # Install dependencies (skip postinstall scripts)
    
    npm install --ignore-scripts
    

    # Install package to staging directory
    local staging_lib="${pkgdir}/usr/lib/node_modules/gsd-pi"
    install -dm755 "${staging_lib}"
    cp -r . "${staging_lib}"

    # Create bin symlinks - use absolute path for runtime
    install -dm755 "${pkgdir}/usr/bin"
    local install_lib="/usr/lib/node_modules/gsd-pi"

    if [ -f package.json ] && [ -n "$(jq -r '.bin // {}' package.json)" ]; then
        # Read bin entries from package.json and create symlinks
        jq -r '.bin | to_entries[] | "\(.key)=\(.value)"' package.json | while read -r line; do
            local bin_name="${line%%=*}"
            local bin_path="${line##*=}"
            ln -s "${install_lib}/${bin_path}" "${pkgdir}/usr/bin/${bin_name}"
            chmod +x "${staging_lib}/${bin_path}"
        done
        
    else
        # Fallback: use binary_name if no bin entries in package.json
        if [ -f "bin/gsd" ]; then
            ln -s "${install_lib}/bin/gsd" "${pkgdir}/usr/bin/gsd"
            chmod +x "${staging_lib}/bin/gsd"
        fi
        
    fi

    # Clean up package.json files
    find "${pkgdir}" -name "package.json" -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson
    for pkgjson in $(find "${pkgdir}" -type f -name "package.json"); do
        jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done

    find "${pkgdir}" -type f -name "package.json" | while read -r pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done

    

    

    

    
}