# Maintainer: Diego Augusto <diegovsky.dev@gmail.com>
_pkgname=lix
pkgname=haxe-lix
pkgver=16.0.2
pkgrel=2
pkgdesc="Dependency manager for Haxe projects"
arch=('any')
url="https://github.com/lix-pm/lix"
license=('MIT')
depends=('nodejs')
conflicts=(haxe neko)
provides=(haxe neko)
makedepends=('npm')
source=(
    "https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz"
)
sha256sums=(
    '02f513a86e07ed149d876459f2bc210dce136cf5b41b7e1f34eb99be120cc4e5'
)

package() {
    cd "$srcdir/package"

    # copy scripts to /usr/lib/node_modules/lix
    install -dm755 "$pkgdir/usr/lib/node_modules/$_pkgname"
    cp -r . "$pkgdir/usr/lib/node_modules/$_pkgname/"

    install -dm755 "$pkgdir/usr/bin"

    sources=(
        'lix' 'lix.js'
    )


    for bin in haxe haxelib neko; do
        script="${bin}shim.js"
        sources+=("$bin" "$script")
    done

    prefix="/usr/lib/node_modules/$_pkgname/bin"

    echo ${sources[@]}

    for i in $(seq 0 2 ${#sources[@]}); do
        bin=${sources[i]}
        script=${sources[i+1]}

        if [[ -n "$bin" ]]; then
            target="$pkgdir/usr/bin/$bin" 
            script="$prefix/$script"

            ln -s "$script" "$target"
              
        fi
    done
    chmod a+x "$pkgdir/usr/lib/node_modules/$_pkgname/bin/"*

    set +x
}
