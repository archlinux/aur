# Maintainer: LuckyturtleDev [aur at lukas1818 dot de]

pkgname=inversecsg
pkgver=r1
pkgrel=2
pkgdesc="Automatic Conversion of 3D Models to CSG Trees"
arch=('any')
url="http://inversecsg.csail.mit.edu/"
makedepends=('sd' 'ripgrep')
depends=('autoconf' 'bison' 'cmake' 'eigen' 'flex' 'ipython' 'libtool' 'mercurial' 'python' 'python-scikit-learn' 'python-numpy' 'python-scipy' 'python-matplotlib'  'sketch' 'zsh') #'python-sketch'
source=("https://dl.acm.org/action/downloadSupplement?doi=10.1145%2F3272127.3275006&file=a213-du.zip"
        "remove_genetic_algorithm_pipeline.patch"
        "set_ENVIRONMENT_file.patch"
        "default_build_dir.patch"
        "mesh_arg_is_not_optional.patch"
        "ENVIRONMENT")
sha512sums=('5129a87f675ad4963c23d362862d5f16c8fb9f065d028f970d8b9a36db446f297603ca5f4d0cd3822b86d8ce5e088c6d7354dfa33b43e27fdf702fd8996da263'
            '9c6ac477af4192056f329d189cd8e7c16f5e4de4b83b9e8d21fb05f0142aa77f526ffbe47bf30292a34210559d203cd9f8920f5345b46154d7a2b39960a8a325'
            '15168403b011374c82b73f2b478c47c476df4db20e3feba5d18aa32afbe4cc644bf9ad8bae2268be4e8cb7900d38e7f27cc2efd3e1e1534c4ef01535f97dac39'
            '4d56563cbee8b2c0abd31f63afc8266c1516af983479f51141a2899a28401ff93d7cadc9a3d05f861412fffa3bb6545f44946e9c52838c6a20257a1da79f638f'
            'e6301e41fe2f2482c01e66cb123c3db457c1cfedb8637bb1de09442aa9fad4710f3109fdbd391c2575ec1b7455034916dedab186963fdf76b7490fee8a19ff4f'
            '3462c27e4b9c53f0732b839016fb9fd03759850b83cf69b1709f5588e8b5f5c86462aa7accc9fc6f51559c2966b9bf419107b328ebcf45d687a09e6a685dbe25')

prepare() {
	cd "$srcdir/inverse_csg/"
	
	# I have no idea from with lib the remove_genetic_algorithm_pipeline came from, disable it to avoid import error
	patch -Np1 -i "$srcdir/remove_genetic_algorithm_pipeline.patch"
	
	# change patch of the `ENVIRONMENT` file to `/opt/inverscsg/ENVIRONMENT`, to be able to run this program with every working directory
	patch -Np1 -i "$srcdir/set_ENVIRONMENT_file.patch"
	
	# looks like build_dir does not do anything anymore; howerever the folder must still exist; change default to `/opt/inverscsg/` to avoid error
	patch -Np1 -i "$srcdir/default_build_dir.patch"
	
	# the mesh comand line argument is not optional
	patch -Np1 -i "$srcdir/mesh_arg_is_not_optional.patch"
	
	# interpreter is missing
	sed -i '1 i\#!/usr/bin/python' main.py
	
	mkdir -p build/cpp
	cd "$srcdir/inverse_csg/cpp"
	
	# eingen include paths are wrong everywehre
	rg -w --files-with-matches  '#include "Eigen/Dense"' | while read file
	do
		echo "fix eigen include in $file"
		sd '#include "Eigen/Dense"' '#include <eigen3/Eigen/Dense>' "$file"
	done
	sd '#include "unsupported/Eigen/Polynomials"' '#include <eigen3/unsupported/Eigen/Polynomials>' src/common/polynomial.cpp src/test/test_polynomial_roots.cpp

	# need differnt c++ verison as definded at the CMakeLists.txt
	sd 'std=c\+\+11' 'std=c++14' CMakeLists.txt
}

build() {
	cd "$srcdir/inverse_csg/build/cpp"
	cmake ../../cpp
	make
}

package() {
	cd "$srcdir/inverse_csg/"
	install -Dm755 "build/cpp/csg_cpp_command" "$pkgdir/usr/bin/csg_cpp_command"
	# maybe not the best path, but it does work
	mkdir -p "$pkgdir/opt/$pkgname/"
	install -Dm755 "main.py" "$pkgdir/opt/$pkgname/"
	_py_help_path="$pkgdir/opt/$pkgname/"
	install -Dm755 "helper.py" "$_py_help_path"
	install -Dm755 "install.py" "$_py_help_path"
	install -Dm755 "point_cloud_seg.py" "$_py_help_path"
	install -Dm755 "primitive_to_sketch.py" "$_py_help_path"
	install -Dm755 "print_data_file.py" "$_py_help_path"
	install -Dm755 "run_tests.py" "$_py_help_path"
	install -Dm755 "sketch_pipeline.py" "$_py_help_path"
	install -Dm755 "surface_primitive_to_sketch.py" "$_py_help_path"
	install -Dm755 "transforms.py" "$_py_help_path"
	install -Dm755 "visualize_point_cloud.py" "$_py_help_path"
	# install required config file
	cp "../ENVIRONMENT" "$pkgdir/opt/$pkgname/ENVIRONMENT"
	
	ln -s "$pkgdir/opt/inversecsg/main.py" "$pkgdir/usr/bin/inversecsg"
}
