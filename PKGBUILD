# Maintainer: Alexander Shukaev <http://Alexander.Shukaev.name>
#
pkgname='casablanca-git'
pkgver=r1490.78f8554
pkgrel=1
pkgdesc=\
'Modern asynchronous C++ API for cloud-based client-server communication'
url='http://casablanca.codeplex.com/'
license=('APACHE')
arch=('i686'
      'x86_64')
provides=('casablanca'
          'cpprest'
          'cpprestsdk')
conflicts=('casablanca'
           'cpprest'
           'cpprestsdk')
depends=('boost'
         'openssl')
optdepends=('websocketpp: system instead of embedded')
makedepends=('cmake'
             'git'
             'ninja')
options=('staticlibs'
         'strip')
source=("${pkgname}"::'git://github.com/Microsoft/cpprestsdk.git'
        'outside_tests.cpp.diff')
sha256sums=('SKIP'
            '7df9ca8fd425e4639c5d2a2abbb521cfadc7eaf07baffda7897435ae85a2993d')
#
pkgver() {
  cd "${pkgname}"
  printf 'r%s.%s'                                                              \
         "$(git rev-list  --count 'HEAD')"                                     \
         "$(git rev-parse --short 'HEAD')"
}
#
prepare() {
  cd "${pkgname}"
  for diff in "${srcdir}"/*.diff; do
    patch --binary --forward -p0 < "${diff}"
  done
  mkdir -p "Release/.build"
}
#
build() {
  cd "${pkgname}/Release/.build"
     cpp_flags='-DNDEBUG'
       c_flags="-pipe -O3 -fomit-frame-pointer -funroll-loops ${cpp_flags}"
     cxx_flags="${c_flags}"
  linker_flags='-s -Wl,-s'
  cmake '..'                                                                   \
        -G 'Ninja'                                                             \
                 -DCMAKE_BUILD_TYPE='Release'                                  \
                -DBUILD_SHARED_LIBS='N'                                        \
                    -DCMAKE_C_FLAGS="${c_flags}"                               \
                  -DCMAKE_CXX_FLAGS="${cxx_flags}"                             \
           -DCMAKE_EXE_LINKER_FLAGS="${linker_flags}"                          \
        -DCMAKE_SHARED_LINKER_FLAGS="${linker_flags}"                          \
             -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
  # make
}
#
check() {
  cd "${pkgname}/Release/.build/Binaries"
  ./test_runner
}
#
package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C 'Release/.build' install/strip
  # make -C 'Release/.build' DESTDIR="${pkgdir}" install/strip
  install -Dm644 'license.txt'                                                 \
                 "${pkgdir}/usr/share/licenses/casablanca/LICENSE"
  install -Dm644 'ThirdPartyNotices.txt'                                       \
                 "${pkgdir}/usr/share/licenses/casablanca/ThirdPartyNotices"
}
