# Maintainer: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: TheEdgeOfRage on AUR

_pkgname=aws-crt-python
pkgname=aws-cli-v2-python-awscrt
# https://github.com/awslabs/aws-crt-python/releases
pkgver=0.25.4
pkgrel=1
pkgdesc='A common runtime for AWS Python projects. A fork of the official arch package, kept at the version required by aws-cli-v2.'
arch=(x86_64)
url='https://github.com/awslabs/aws-crt-python'
# https://github.com/awslabs/aws-crt-python/blob/v0.20.11/setup.py#L2
license=('Apache-2.0')
depends=(glibc gcc-libs python openssl)
makedepends=(git cmake python-build python-installer python-setuptools python-wheel)
checkdepends=(python-websockets)
provides=("python-awscrt=$pkgver")
conflicts=(python-awscrt)
source=("git+https://github.com/awslabs/aws-crt-python.git#tag=v$pkgver"
        "test-timeout-workaround.diff"
        "websocket-test-fix.diff"
        "git+https://github.com/awslabs/aws-c-auth"
        "git+https://github.com/awslabs/aws-c-cal"
        "git+https://github.com/awslabs/aws-c-common"
        "git+https://github.com/awslabs/aws-c-compression"
        "git+https://github.com/awslabs/aws-c-event-stream"
        "git+https://github.com/awslabs/aws-c-http"
        "git+https://github.com/awslabs/aws-c-io"
        "git+https://github.com/awslabs/aws-c-mqtt"
        "git+https://github.com/awslabs/aws-c-s3"
        "git+https://github.com/awslabs/aws-c-sdkutils"
        "git+https://github.com/awslabs/aws-checksums"
        "git+https://github.com/awslabs/s2n")
sha256sums=('c451ff04e807e4a98429bac29ea59b9bcc3f652ef3963e9ae4c9ce60f903866c'
            '2a76a90dfa59b2fadf25f6e74cd7ff516a50d6b4005f185b9fa2df48ece86d79'
            '6be7207919af674ad189a1cd7cd3d17b6e3673017b7599c7807b36840fc7a067'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # https://github.com/awslabs/aws-crt-python/blob/v$pkgver/.gitmodules
  git submodule init
  for crt in aws-c-auth aws-c-cal aws-c-common aws-c-compression aws-c-event-stream aws-c-http aws-c-io aws-c-mqtt aws-c-s3 aws-checksums s2n; do
    git config submodule.aws-common-runtime/$crt.url "$srcdir"/$crt
    git -c protocol.file.allow=always submodule update crt/$crt
  done
  for crt in aws-c-sdkutils; do
    git config submodule.crt/$crt.url "$srcdir"/$crt
    git -c protocol.file.allow=always submodule update crt/$crt
  done

  # Work-around timeout in test_h2_client. Although the test file takes less than 10 seconds to download with curl,
  # the test takes more than 80 seconds.
  patch -Np0 -i ../test-timeout-workaround.diff
}

build() {
  cd $_pkgname

  # Use proper version in .dist-info
  # See https://github.com/awslabs/aws-crt-python/blob/main/continuous-delivery/update-version.py
  # Don't move this line to prepare(), as pkgver() runs after prepare()
  sed -i -r "s/__version__ = '[^']+'/__version__ = '$pkgver'/" awscrt/__init__.py

  # Use system libcrypto.so instead of bundled aws-lc
  export AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO=1

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname

  # Fix broken test until python-websockets is updated to >=13.0
  patch -Np0 -i ../websocket-test-fix.diff

  pyver=$(python -c "import sys; print('{}{}'.format(*sys.version_info[:2]))")
  export PYTHONPATH="$PWD:$PWD/build/lib.linux-$CARCH-cpython-$pyver"
  python -m unittest discover test
}

package() {
  depends+=(libcrypto.so)

  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
