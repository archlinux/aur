# Maintainer: Rhys Perry <rhysperry111 AT gmail DOT com>
pkgname=engine-sim-git
provides=('engine-sim')
conflicts=('engine-sim')
pkgver=r250.3d767af
pkgrel=1
license=('MIT')
pkgdesc='Combustion engine simulator that generates realistic audio.'
makedepends=('cmake' 'bison' 'boost' 'flex' 'git')
depends=('sdl2' 'sdl2_image')
arch=('any')
url='https://github.com/ange-yaghi/engine-sim'
source=('git+https://github.com/bobsayshilol/engine-sim.git#branch=sdl-build'
        # Submodules
        'git+https://github.com/ange-yaghi/csv-io.git'
        'git+https://github.com/bobsayshilol/delta-studio.git#branch=sdl-build'
        'git+https://github.com/ange-yaghi/direct-to-video.git'
        'git+https://github.com/bobsayshilol/piranha.git#branch=sdl-build'
        'git+https://github.com/bobsayshilol/simple-2d-constraint-solver.git#branch=gcc-fixes'
        )
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd engine-sim
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    # Submodule stuff
    cd engine-sim
    git submodule init

    # Changes to use local sources
    for SUBMODULE in 'csv-io' 'delta-studio' 'direct-to-video' 'piranha' 'simple-2d-constraint-solver'; do
        git submodule set-url "dependencies/submodules/${SUBMODULE}" "${srcdir}/${SUBMODULE}"
    done
    git submodule set-branch --branch sdl-build 'dependencies/submodules/piranha'
    git submodule set-branch --branch sdl-build 'dependencies/submodules/delta-studio'
    git submodule set-branch --branch gcc-fixes 'dependencies/submodules/simple-2d-constraint-solver'

    git -c protocol.file.allow=always submodule update
}

build() {
	cd engine-sim
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DENGINE_SIM_DATA_ROOT=/usr/share/engine-sim ..
	cmake --build . --target engine-sim-app
}

package() {
	cd engine-sim
	# Install license to usr/share
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wava/LICENSE"
	# Install binary to usr/bin
	install -Dm755 build/engine-sim-app "${pkgdir}/usr/bin/engine-sim"

	# Install data to usr/share
    mkdir -p "${pkgdir}/usr/share/engine-sim/"
    cp -r assets es "${pkgdir}/usr/share/engine-sim/"
    mkdir -p "${pkgdir}/usr/share/engine-sim/dependencies/submodules/delta-studio/engines/basic/"
    cp -r dependencies/submodules/delta-studio/engines/basic/fonts dependencies/submodules/delta-studio/engines/basic/shaders "${pkgdir}/usr/share/engine-sim/dependencies/submodules/delta-studio/engines/basic/"
}
