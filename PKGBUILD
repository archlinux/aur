# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=typephp
pkgver=0.6.6
pkgrel=1
pkgdesc='AOT compiler that compiles PHP to native binaries'
arch=('x86_64' 'aarch64')
url='https://github.com/swoole/typephp'
license=('GPL-3.0-or-later')
depends=('cmake' 'gcc' 'gcc-libs' 'glibc' 'gmp' 'make' 'mpfr' 'php' 'php-embed' 'pkgconf' 'python')
makedepends=('composer' 'patchelf' 'python-setuptools')
_phpy_commit=5b9c650316ad87644e885a64a0a6767b03abdfa6
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/swoole/typephp/archive/refs/tags/v${pkgver}.tar.gz"
  "phpy-${_phpy_commit}.tar.gz::https://github.com/swoole/phpy/archive/${_phpy_commit}.tar.gz"
  'tpc.sh'
  'php-config.sh'
  'typephp-root-path.patch'
)
b2sums=('47208b0fc9eeedc56655233692e0d92af8bea4d1ad98848a5b591cd1db14c4d0526d30d28fa00902f936fbb056d52b067b170229a326aab8ebe636a6f098e489'
        '1054bbbf7ca92037dbbc6306509ea9079f5bfe787aac50dec325f900ec1ef3d58ec4c84ae9a4a4d3d58f2acba8431a221cb69a04cfc92984ae9e3c1a5c914b4e'
        '65d611297e462695090408e36fdd81c879b6d1dda3f712a9bc2eee0ce30c588adec69e5db46a8a624bf5c77615f61859147f5ae3693945ec41e8707d1a208f08'
        '0fb3520559f06c333b67894671815fb570ee7b5ffa3f1d1b2f6176a87dd123534457a66fb1a7fa69c7021421126faff0522237b8b8802056f6cea8e88e9b27d3'
        '0c2402dec6bfe10ef7abd18e0ed1d8f95939992bd5ebf5e5c91cd5d26466ecf84c562d9383c38296a5287433cc1e21d1b5c700d29f3cbbd3477c2eb0cc5b3059')

prepare() {
  local php_args=()

  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/typephp-root-path.patch"

  # Arch ships iconv.so with php, but extensions may be disabled in php.ini.
  # Load it for Composer without modifying the host's PHP configuration.
  php -r 'exit(extension_loaded("iconv") ? 0 : 1);' || \
    php_args=(-d extension=iconv)
  php "${php_args[@]}" /usr/bin/composer install \
    --no-dev \
    --prefer-dist \
    --no-progress \
    --classmap-authoritative
}

build() {
  local src="${srcdir}/${pkgname}-${pkgver}"
  local phpx_home="${src}/vendor/swoole/phpx"

  cd "${srcdir}/phpy-${_phpy_commit}"
  phpize
  ./configure
  make

  cmake -S "${phpx_home}" -B "${phpx_home}/build" \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_TESTS=OFF \
    -D BUILD_EXT=OFF \
    -D GITHUB_ACTION=ON \
    -D php_dir="$(php-config --prefix)"
  cmake --build "${phpx_home}/build" --target phpx --parallel "$(nproc)"

  cd "${src}"
  PHPX_HOME="${phpx_home}" \
  PHP_HOME="$(php-config --prefix)" \
  LD_LIBRARY_PATH="${phpx_home}/lib:$(php-config --prefix)/lib" \
    php -d "extension=${srcdir}/phpy-${_phpy_commit}/modules/phpy.so" \
      bin/tpc.php project.yml --job "$(nproc)" --no-progress

  test -x tpc
}

check() {
  local src="${srcdir}/${pkgname}-${pkgver}"
  local phpx_home="${src}/vendor/swoole/phpx"

  PHPX_HOME="${phpx_home}" \
  PHP_HOME="$(php-config --prefix)" \
  LD_LIBRARY_PATH="${phpx_home}/lib:$(php-config --prefix)/lib" \
    "${src}/tpc" --version
}

package() {
  local src="${srcdir}/${pkgname}-${pkgver}"
  local appdir="${pkgdir}/opt/typephp"

  install -d "${appdir}"
  cp -a "${src}/vendor" "${appdir}/vendor"
  rm -rf "${appdir}/vendor/swoole/phpx/build"
  install -Dm755 "${src}/tpc" "${appdir}/tpc"

  # Arch's PHP package currently ships a php_hash.h revision which is valid C
  # but not C++. Keep pacman-owned headers untouched and patch a private SDK
  # copy, matching the workaround used by TypePHP's upstream CI.
  install -d "${appdir}/php/include" "${appdir}/php/lib"
  cp -a /usr/include/php "${appdir}/php/include/php"
  if grep -Fq 'char *base = ecalloc(' \
      "${appdir}/php/include/php/ext/hash/php_hash.h"; then
    patch -Np1 -d "${appdir}/php/include/php" \
      -i "${src}/.github/patches/php-hash-cxx.patch"
  else
    printf '%s\n' 'php_hash.h already contains the upstream C++ fix'
  fi
  install -Dm755 "${srcdir}/php-config.sh" "${appdir}/php/bin/php-config"
  ln -s /usr/bin/php "${appdir}/php/bin/php"
  ln -s /usr/lib/libphp.so "${appdir}/php/lib/libphp.so"

  # Generated Linux binaries require libphpx in the system loader path.
  # Keep the Composer PHPX layout intact via a symlink because
  # the compiler also checks PHPX_HOME/lib/libphpx.so.
  install -Dm755 "${appdir}/vendor/swoole/phpx/lib/libphpx.so" \
    "${pkgdir}/usr/lib/libphpx.so"
  patchelf --set-rpath '/usr/lib' "${pkgdir}/usr/lib/libphpx.so"
  rm "${appdir}/vendor/swoole/phpx/lib/libphpx.so"
  ln -s /usr/lib/libphpx.so \
    "${appdir}/vendor/swoole/phpx/lib/libphpx.so"

  patchelf --set-rpath '$ORIGIN/vendor/swoole/phpx/lib:/usr/lib' \
    "${appdir}/tpc"

  install -Dm755 "${srcdir}/tpc.sh" "${pkgdir}/usr/bin/tpc"

  install -Dm644 "${src}/completions/tpc.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/tpc"
  install -Dm644 "${src}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # phpy is licensed under the Apache License
  install -Dm644 "${srcdir}/phpy-${_phpy_commit}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-phpy"
  install -Dm644 "${src}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
