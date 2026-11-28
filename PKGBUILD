# Maintainer: krant <aleksey.vasilenko@gmail.com>
pkgname=fluidx3d
pkgver=3.9
pkgrel=1
pkgdesc="The fastest and most memory efficient lattice Boltzmann CFD software, using OpenCL"
arch=(x86_64 aarch64)
url=https://github.com/ProjectPhysX/FluidX3D
license=('LicenseRef-FluidX3D' 'CC0-1.0' 'CC-BY-4.0' 'CC-BY-NC-4.0' 'CC-BY-NC-ND-4.0')
depends=(ocl-icd libxrandr)
makedepends=(opencl-clhpp ninja)
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/krant/fluidx3d-stl/releases/download/1.0/fluidx3d-stl.tar.zst"
)

sha256sums=(
    '2697dce876e089169c1109d02665b3c6d2ed7181853967f886aabfee3d9b68b0'
    '3695e17d203debf0603f50c7456394d1be9eb8c7ae67f3095222e7ade41ddae7'
)

add_bin() {
    # string to search e.g. "electric ducted fan"
    local str="$1"
    # normalized name, "Electric-ducted-fan"
    local n="${1// /-}"; n="${n^}"
    # C defines
    shift
    local defs="${@/#/-D}"

    cat >> bins.ninja <<EOF
build out/setup_${n}.cpp: patch src/setup.cpp
  search = $str
build out/setup_${n}.o: cxx out/setup_${n}.cpp
  defs = $defs -Isrc
build out/info_${n}.o: cxx src/info.cpp
  defs = $defs
build out/lbm_${n}.o: cxx src/lbm.cpp
  defs = $defs
build out/main_${n}.o: cxx src/main.cpp
  defs = $defs
build out/graphics_${n}.o: cxx src/graphics.cpp
  defs = $defs
build out/FluidX3D-${n}: link out/kernel.o out/lodepng.o out/shapes.o out/info_${n}.o out/lbm_${n}.o out/main_${n}.o out/graphics_${n}.o out/setup_${n}.o
EOF
}

prepare() {
    cd FluidX3D-$pkgver
    # Fixups
    rm -rf src/{OpenCL,X11}
    sed -i 's|X11/include/||g' src/graphics.cpp
    sed -i "/define FP16S\|define D3Q19\|define BENCHMARK/d" src/defines.hpp
    sed -i "/lbm.write_status/d" src/setup.cpp
    sed -i 's|get_exe_path()+\"../skybox/skybox8k.png|\"/usr/share/fluidx3d/skybox8k.png|' src/lbm.hpp
    for stl in concord_cut_large techtris_airplane X-Wing DWG_Tie_Fighter_Assembled_02 FAN_Solid_Bottom edf_v391 edf_v39 Cow_t Full_Shuttle StarShipV2; do
      sed -i "s|get_exe_path()+\"../stl/$stl.stl|\"/usr/share/fluidx3d/$stl.stl|" src/setup.cpp
    done
    # Generate build.ninja
    cat > bins.ninja <<EOF
rule patch
  command = sed "/\$search/c\\\\void main_setup() {" \$in > \$out
build out/lodepng.o: cxx src/lodepng.cpp
build out/kernel.o: cxx src/kernel.cpp
build out/shapes.o: cxx src/shapes.cpp
EOF
    # Add ninja rules for each binary
    add_bin "3D Taylor-Green"              D3Q19 FP16S
    add_bin "2D Taylor-Green"              D2Q9  FP16S
    add_bin "2D Karman vortex street"      D2Q9  FP16S EQUILIBRIUM_BOUNDARIES
    add_bin "delta wing"                   D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "Concorde"                     D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "Boeing 747"                   D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "Star Wars X-wing"             D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "Star Wars TIE fighter"        D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "aerodynamics of a cow"        D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "Space Shuttle"                D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "Starship"                     D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID
    add_bin "electric ducted fan"          D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID MOVING_BOUNDARIES
    add_bin "radial fan"                   D3Q19 FP16S MOVING_BOUNDARIES SUBGRID
    add_bin "Taylor-Couette flow"          D3Q19 FP16S MOVING_BOUNDARIES
    add_bin "lid-driven cavity"            D3Q19 FP16S MOVING_BOUNDARIES
    add_bin "dam break"                    D3Q19 FP16S VOLUME_FORCE SURFACE
    add_bin "river"                        D3Q19 FP16S VOLUME_FORCE SURFACE
    add_bin "bursting bubble"              D3Q19 FP16C VOLUME_FORCE SURFACE
    add_bin "cube with changing gravity"   D3Q19 FP16S VOLUME_FORCE SURFACE
    add_bin "periodic faucet"              D3Q19 FP16S VOLUME_FORCE SURFACE
    add_bin "two colliding droplets"       D3Q19 FP16S VOLUME_FORCE SURFACE FORCE_FIELD
    add_bin "liquid metal on a speaker"    D3Q19 FP16S VOLUME_FORCE SURFACE MOVING_BOUNDARIES
    add_bin "breaking waves on beach"      D3Q19 FP16S VOLUME_FORCE SURFACE EQUILIBRIUM_BOUNDARIES
    add_bin "raindrop impact"              D3Q19 FP16C VOLUME_FORCE SURFACE EQUILIBRIUM_BOUNDARIES
    add_bin "hydraulic jump"               D3Q19 FP16S VOLUME_FORCE SURFACE EQUILIBRIUM_BOUNDARIES MOVING_BOUNDARIES SUBGRID
    add_bin "particle test"                D3Q19 FP16S VOLUME_FORCE MOVING_BOUNDARIES FORCE_FIELD PARTICLES
    add_bin "cylinder in rectangular duct" D3Q19 FP16S VOLUME_FORCE
    add_bin "Rayleigh-Benard convection"   D3Q19 FP16S TEMPERATURE
    add_bin "thermal convection"           D3Q19 FP16S TEMPERATURE
    add_bin "Benchmark-FP32-FP16C"         D3Q19 FP16C BENCHMARK
    add_bin "Benchmark-FP32-FP16S"         D3Q19 FP16S BENCHMARK
    add_bin "Benchmark-FP32-FP32"          D3Q19 BENCHMARK
}

build() {
    cd FluidX3D-$pkgver
    cat > build.ninja <<EOF
rule cxx
  command = g++ $CXXFLAGS -DINTERACTIVE_GRAPHICS \$defs -c \$in -o \$out
rule link
  command = g++ $CXXFLAGS $LDFLAGS \$in -lOpenCL -lX11 -lXrandr -o \$out
include bins.ninja
EOF
	ninja
}

package() {
    cd FluidX3D-$pkgver
    install -vDm644 -t "$pkgdir/usr/share/$pkgname" skybox/skybox8k.png ../*.stl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/stl" ../LICENSE.md
    install -vDm755 -t "$pkgdir/usr/bin" out/FluidX3D*
}
