# Maintainer: Premysl Srubar <premysl.srubar at gmail com>
pkgname=python-mediapipe-git
pkgver=v0.8.6.r0.g374f5e2e
pkgrel=1
pkgdesc="MediaPipe offers cross-platform, customizable ML solutions for live and streaming media."
arch=('any')
url="https://github.com/google/mediapipe"
license=("Apache")
depends=('ffmpeg' 'absl-py' 'python-attrs' 'python-matplotlib' 'python-numpy' 'python-opencv' 'python-protobuf' 'python-six' 'python-wheel')
#gcc-8 g++-8
makedepends=('git' 'python-setuptools' 'bazel' 'gcc10')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname}::git+${url}.git" 
        "BUILD-opencvStatic.patch")
        
sha256sums=('SKIP'
            'e78d6ab853a78ce47d16346856b3a46562023c205ccd57927203e046cd431841')

# To compile with GPU support, replace
# --define MEDIAPIPE_DISABLE_GPU=1
# with
# --copt -DMESA_EGL_NO_X11_HEADERS --copt -DEGL_NO_X11
# mesa-common-dev libegl1-mesa-dev libgles2-mesa-dev

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname}"
		# 3.7.0 currently, 4.0.0 seems to build with latest bazael just fine
    echo '4.0.0' >.bazelversion
    #Patch old abseil lib?: https://github.com/grpc/grpc/issues/25114  (seems ok with gcc10)

    # Remove  'x86_64-linux-gnu' folder for opencv and ffmpeg
    #https://google.github.io/mediapipe/getting_started/install.html
    sed -i "s!/x86_64-linux-gnu!!g" third_party/ffmpeg_linux.BUILD           
    patch --forward --strip=1 --input="${srcdir}/BUILD-opencvStatic.patch"
    python setup.py gen_protos #Without this the cleanup after the build would fail on non-existing files    
}

build() { 
  
  #gcc11 doesn't compile: https://github.com/grpc/grpc/issues/25114   
  cd "$srcdir/${pkgname}"
  #CC=gcc-10 CXX=g++-10 bazel build --compilation_mode=opt --copt=-DNDEBUG --define=MEDIAPIPE_DISABLE_GPU=1 --action_env=PYTHON_BIN_PATH=/bin/python mediapipe/modules/face_detection/face_detection_short_range_cpu --define=OPENCV=source
  #CC=gcc-10 CXX=g++-10 bazel build --compilation_mode=opt --copt=-DNDEBUG --define=MEDIAPIPE_DISABLE_GPU=1 --action_env=PYTHON_BIN_PATH=/bin/python //mediapipe/python:_framework_bindings.so --define=OPENCV=source
 
  # https://wiki.archlinux.org/index.php/Python_package_guidelines
  #CC=gcc-10 CXX=g++-10 python setup.py build  --install-option="--link_opencv"
  CC=gcc-10 CXX=g++-10 python setup.py build --link-opencv
}

check() {
  cd "$srcdir/${pkgname}"
  CC=gcc-10 CXX=g++-10 bazel run --define MEDIAPIPE_DISABLE_GPU=1 mediapipe/examples/desktop/hello_world:hello_world
}

package() {    
    cd "$srcdir/${pkgname}"    
    python setup.py gen_protos #Without this the cleanup after the install would fail on non-existing files    
    CC=gcc-10 CXX=g++-10 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build --link-opencv
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}

