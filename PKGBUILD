# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=fluidx3d
pkgver=3.5
pkgrel=1
pkgdesc="The fastest and most memory efficient lattice Boltzmann CFD software, using OpenCL"
arch=('x86_64' 'aarch64')
url="https://github.com/ProjectPhysX/FluidX3D"
license=('custom' 'CCPL:by-nc')
depends=('ocl-icd' 'libxrandr')
makedepends=('opencl-clhpp' 'ninja')
options=(!debug)
source=("https://github.com/ProjectPhysX/FluidX3D/archive/refs/tags/v$pkgver.tar.gz"
	"graphics-includes-output.patch"
	"https://cdn.thingiverse.com/assets/92/f0/54/ba/e0/concord_cut_large.stl"
	"https://cdn.thingiverse.com/assets/0b/5c/e5/f3/f0/techtris_airplane.stl"
	"https://cdn.thingiverse.com/assets/49/65/42/33/0f/X-Wing.stl"
	"DWG_Tie_Fighter_Assembled_02.stl::https://cdn.thingiverse.com/assets/f0/3c/64/c7/f5/DWG_Tie_Fighter_Assembled_02.STL"
	"https://cdn.thingiverse.com/assets/1d/89/dd/cb/fd/FAN_Solid_Bottom.stl"
	"https://cdn.thingiverse.com/assets/e6/85/cf/21/70/edf_v391.stl"
	"https://cdn.thingiverse.com/assets/51/31/ed/84/b0/edf_v39.stl"
	"https://cdn.thingiverse.com/assets/90/2a/a5/12/ce/Cow_t.stl"
	"https://cdn.thingiverse.com/assets/6d/23/28/24/ea/Full_Shuttle.stl"
	"https://cdn.thingiverse.com/assets/b8/99/d7/5d/2c/StarShipV2.stl"
)

sha256sums=('259584c4d4f62240696122e27bf7998fe90ced5be72973cd8ce336ae6aed1055'
	'64ec55932632b3c37bda58e4bef350f6649611cb0041dcba9797c69c6164170a'
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

fluid_src=FluidX3D-$pkgver/src

prepare_sample() {
	NAME=${1// /-}
	cp -r $fluid_src $NAME
	sed -i "/$1/c\void main_setup() {" $NAME/setup.cpp

	OBJS=
	for f in 'info' 'lbm' 'main' 'setup' 'graphics'; do
		OBJ=$NAME/$f.o
		OBJS="$OBJS $OBJ"
		echo "build $OBJ: cxx $NAME/$f.cpp" >> samples.ninja
		DEFS=
		for d in $2; do
			DEFS="$DEFS -D$d"
		done
		echo "  defs =$DEFS" >> samples.ninja
	done
	echo "build bin/FluidX3D-$NAME: link $OBJS $fluid_src/kernel.o $fluid_src/lodepng.o $fluid_src/shapes.o" >> samples.ninja
}

fix_stl_path() {
	sed -i 's/get_exe_path()+"..\/stl\/'$1'.stl/"\/usr\/share\/FluidX3D\/'$1'.stl/' src/setup.cpp
}

prepare() {
	cd FluidX3D-$pkgver
	patch -p1 -i "$srcdir/graphics-includes-output.patch"

	rm -rf src/{OpenCL,X11}
	sed -i "/define FP16S/d" src/defines.hpp
	sed -i "/define D3Q19/d" src/defines.hpp
	sed -i "/define BENCHMARK/d" src/defines.hpp
	sed -i "/lbm.write_status/d" src/setup.cpp

	fix_stl_path concord_cut_large
	fix_stl_path techtris_airplane
	fix_stl_path X-Wing
	fix_stl_path DWG_Tie_Fighter_Assembled_02
	fix_stl_path FAN_Solid_Bottom
	fix_stl_path edf_v391
	fix_stl_path edf_v39
	fix_stl_path Cow_t
	fix_stl_path Full_Shuttle
	fix_stl_path StarShipV2
	sed -i 's/get_exe_path()+"..\/skybox\/skybox8k.png/"\/usr\/share\/FluidX3D\/skybox8k.png/' src/lbm.hpp

	cd ..

	rm -f samples.ninja
	prepare_sample "3D Taylor-Green vortices" "D3Q19 FP16S"
	prepare_sample "2D Taylor-Green vortices" "D2Q9 FP16S"
	prepare_sample "cylinder in rectangular duct" "D3Q19 FP16S VOLUME_FORCE"
	prepare_sample "Taylor-Couette flow" "D3Q19 FP16S MOVING_BOUNDARIES"
	prepare_sample "lid-driven cavity" "D3Q19 FP16S MOVING_BOUNDARIES"
	prepare_sample "2D Karman vortex street" "D2Q9 FP16S EQUILIBRIUM_BOUNDARIES"
	prepare_sample "particle test" "D3Q19 FP16S VOLUME_FORCE FORCE_FIELD MOVING_BOUNDARIES PARTICLES"
	prepare_sample "delta wing" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	#prepare_sample "NASA Common Research Model" "D3Q19 FP16C EQUILIBRIUM_BOUNDARIES SUBGRID"
	prepare_sample "Concorde" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	prepare_sample "Boeing 747" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	prepare_sample "Star Wars X-wing" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	prepare_sample "Star Wars TIE fighter" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	prepare_sample "radial fan" "D3Q19 FP16S MOVING_BOUNDARIES SUBGRID"
	prepare_sample "electric ducted fan" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES MOVING_BOUNDARIES SUBGRID"
	prepare_sample "aerodynamics of a cow" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	prepare_sample "Space Shuttle" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	prepare_sample "Starship" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES SUBGRID"
	#prepare_sample "Ahmed body" "D3Q19 FP16C FORCE_FIELD EQUILIBRIUM_BOUNDARIES SUBGRID"
	#prepare_sample "Cessna 172 propeller aircraft" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES MOVING_BOUNDARIES SUBGRID"
	#prepare_sample "Bell 222 helicopter" "D3Q19 FP16C EQUILIBRIUM_BOUNDARIES MOVING_BOUNDARIES SUBGRID"
	#prepare_sample "Mercedes F1 W14 car" "D3Q19 FP16S EQUILIBRIUM_BOUNDARIES MOVING_BOUNDARIES SUBGRID"
	prepare_sample "hydraulic jump" "D3Q19 FP16S VOLUME_FORCE EQUILIBRIUM_BOUNDARIES MOVING_BOUNDARIES SURFACE SUBGRID"
	prepare_sample "dam break" "D3Q19 FP16S VOLUME_FORCE SURFACE"
	prepare_sample "liquid metal on a speaker" "D3Q19 FP16S VOLUME_FORCE MOVING_BOUNDARIES SURFACE"
	prepare_sample "breaking waves on beach" "D3Q19 FP16S VOLUME_FORCE EQUILIBRIUM_BOUNDARIES SURFACE"
	prepare_sample "river" "D3Q19 FP16S VOLUME_FORCE SURFACE"
	prepare_sample "raindrop impact" "D3Q19 FP16C VOLUME_FORCE EQUILIBRIUM_BOUNDARIES SURFACE"
	prepare_sample "bursting bubble" "D3Q19 FP16C VOLUME_FORCE SURFACE"
	prepare_sample "cube with changing gravity" "D3Q19 FP16S VOLUME_FORCE SURFACE"
	prepare_sample "periodic faucet mass conservation test" "D3Q19 FP16S VOLUME_FORCE SURFACE"
	prepare_sample "two colliding droplets in force field" "D3Q19 FP16S VOLUME_FORCE FORCE_FIELD SURFACE"
	prepare_sample "Rayleigh-Benard convection" "D3Q19 FP16S TEMPERATURE"
	prepare_sample "thermal convection" "D3Q19 FP16S TEMPERATURE"
}

build() {
	cat >build.ninja <<EOF
rule cxx
  command = g++ \$defs -DINTERACTIVE_GRAPHICS $CXXFLAGS -c \$in -o \$out
rule link
  command = g++ -lOpenCL -lX11 -lXrandr $CXXFLAGS $LDFLAGS \$in -o \$out
build $fluid_src/kernel.o: cxx $fluid_src/kernel.cpp
build $fluid_src/lodepng.o: cxx $fluid_src/lodepng.cpp
build $fluid_src/shapes.o: cxx $fluid_src/shapes.cpp
include samples.ninja
EOF

	ninja
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp bin/* "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/share/FluidX3D"
	cp *.stl "$pkgdir/usr/share/FluidX3D"
	cp FluidX3D-$pkgver/skybox/skybox8k.png "$pkgdir/usr/share/FluidX3D"

	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 FluidX3D-$pkgver/LICENSE.md
}
