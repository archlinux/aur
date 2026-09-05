# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=fluidx3d
pkgver=3.8
pkgrel=1
pkgdesc="The fastest and most memory efficient lattice Boltzmann CFD software, using OpenCL"
arch=(x86_64 aarch64)
url=https://github.com/ProjectPhysX/FluidX3D
license=('custom' 'CCPL:by-nc')
depends=(ocl-icd libxrandr)
makedepends=(opencl-clhpp ninja)

_cdn=https://cdn.thingiverse.com/assets
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$_cdn/92/f0/54/ba/e0/concord_cut_large.stl"
    "$_cdn/0b/5c/e5/f3/f0/techtris_airplane.stl"
    "$_cdn/49/65/42/33/0f/X-Wing.stl"
    "$_cdn/f0/3c/64/c7/f5/DWG_Tie_Fighter_Assembled_02.STL"
    "$_cdn/1d/89/dd/cb/fd/FAN_Solid_Bottom.stl"
    "$_cdn/e6/85/cf/21/70/edf_v391.stl"
    "$_cdn/51/31/ed/84/b0/edf_v39.stl"
    "$_cdn/90/2a/a5/12/ce/Cow_t.stl"
    "$_cdn/6d/23/28/24/ea/Full_Shuttle.stl"
    "$_cdn/b8/99/d7/5d/2c/StarShipV2.stl"
)

sha256sums=(
    'e78b13921f0b03ebca988b2e22bfe1e0a3ca0d80c7c0b7ba33a6dea76637c8b9'
    'db5605f435973c556302124e98ce45dc411ca6a3f71131df37f44ee61f28c9bb'
    'e8fe5827330bc2adfd5161e42c9d5fd6850d909f7581e0d252e30e3dd623f93d'
    '47c1c261e0db21faa300574247b646e1886ad4b69932b6e066cd7bf9911da33a'
    '037a6f8826d6c7c3e96b040bce16485096143ef68c4c25b883ea693c6fdfbb18'
    '6a7ee3e07ce12bad3d94ab8e109ac95d18026f2259131ed5647da7bd563cd344'
    'b1e8368224cbb3a92c641b0c19274b152346d8323bbd2ea6f9fe7091bc6e91d0'
    '348438cf93e06ab539a829584d50e29886f2b430c139c751b9297a0cf684f5fa'
    '1bd05d2986eb96e2080672a241949a35a6e04bfffcbf4cec18bcad74bb695522'
    '7503e0ceb5f6d8436b8c3f10e7104ad0433f84a7402e75ff66409eec790d86fd'
    '00372e3473616e747fe7980170776477ff0eaa265aa1b859c0afe66e85ad43d4'
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
    mv ../DWG_Tie_Fighter_Assembled_02.{STL,stl}
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
    install -vDm755 -t "$pkgdir/usr/bin" out/FluidX3D*
}
