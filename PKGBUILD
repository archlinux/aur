# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >

_pkgname=nyxt
pkgname="${_pkgname}-cef"
pkgver=5.1.0
pkgrel=1
pkgdesc="The hacker's web browser, built on Common Lisp and CEF (default renderer)"
arch=('x86_64')
url="https://nyxt-browser.com"
license=('BSD-3-Clause')

# Disable automatic stripping globally to protect the Lisp heap.
# We will manually strip the CEF shared libraries at the end of package().
options=('!strip')

# Post-install message file (prints instructions about locales)
install=nyxt.install

depends=(
  # Core Lisp and Network
  'sbcl'
  'curl'
  'openssl'
  'sqlite'
  'libfixposix'
  
  # Desktop Integration
  'gtk3'
  
  # CEF / Chromium Linux Runtime Requirements
  'nss'
  'glib2'
  'alsa-lib'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libxtst'
  'libxkbcommon'
)

makedepends=(
  'cmake'
  'make'
  'git'
  'ocicl'
)

optdepends=(
  'webkit2gtk: To compile and run Nyxt with the WebKitGTK renderer instead of CEF'
)

conflicts=("${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")

# Locales to include in the package. Add your required locales here (e.g., 'en-US' 'fr' 'de').
# By default, only English (US) is included to save ~130MB of disk space.
# CEF generates gendered variants for some languages, which are automatically 
# captured by the wildcard in the package() function.
_locales=('en-US')

# The exact upstream CEF 150 tarball
_cef_ver="150.0.22+gc1a097e+chromium-150.0.7871.256"
_cef_url="https://github.com/atlas-engineer/cef/releases/download/150.0.22%2Bgc1a097e%2Bchromium-150.0.7871.256/cef_binary_${_cef_ver}_linux64_minimal.tar.bz2"

source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/atlas-engineer/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  "cef_binary.tar.bz2::${_cef_url}"
  "nyxt.sh"
  "nyxt.install"
)

# Checksums will be generated using `makepkg -g` or your wrapper
sha256sums=('c452362fe2c33117251bcd1c3ed89c38b39277f10622116691e1748f5e9c13a6'
            'd63964452b43b1272c6a3a2884e1b6626894662b8a10dab76304bd9fe6d1dea8'
            '88d936258531f216c762b6d4a2e86d6d0fd3e5d396940395e03e4685c9e60b59'
            '5c2bd06549007e45270192ae88fcdfe3af26fb9c62c8864857018d420f9f84f9')

prepare() {
  cd "${_pkgname}-${pkgver}"
  
  # Fetch Lisp dependencies into the source tree
  ocicl -c never install
  
  # Extract CEF into the source tree so CMake can find it
  tar -xjf "${srcdir}/cef_binary.tar.bz2"
  
  # CEF hardcodes -Werror and -D_FORTIFY_SOURCE=2 in its cmake/cef_variables.cmake.
  # Arch injects -D_FORTIFY_SOURCE=3. We strip both from ALL CMake files in the 
  # entire source tree (including the extracted cef_binary_* directory) to prevent 
  # the fatal GCC redefinition error without dirtying global CFLAGS.
  find . -type f \( -name 'CMakeLists.txt' -o -name '*.cmake' \) -exec sed -i -e 's/-Werror//g' -e 's/-D_FORTIFY_SOURCE=[0-9]//g' {} +
}

build() {
  cd "${_pkgname}-${pkgver}"
  
  # cl-clipboard needs -fPIC to build its shared library. 
  # We append it to Arch's default flags rather than overwriting them.
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  
  local _cef_root=$(ls -d cef_binary_*)
  
  # Override the ASDF source registry at build time. This prevents the dumped
  # Lisp core from baking in the temporary build path (a privacy leak). It 
  # tells the compiled binary that its source logically resides in the system 
  # installation directory.
  make all \
    CL_SOURCE_REGISTRY="/usr/share/${_pkgname}//" \
    NYXT_RENDERER=cef \
    CEF_ROOT="$PWD/${_cef_root}" \
    PREFIX=/usr
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  # 1. Create target directories
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/${_pkgname}"
  
  # 2. Install the dumped Lisp binary
  install -m 755 nyxt "${pkgdir}/usr/lib/${_pkgname}/nyxt"
  
  # 3. Install CEF resources and the cl-cef bridge
  local _cef_build=$(ls -d ocicl/cl-cef-*/build)
  
  install -m 755 "${_cef_build}/cl-cef-helper" "${pkgdir}/usr/lib/${_pkgname}/"
  
  # ROBUST CEF ASSET COPYING:
  # Instead of guessing filenames, dynamically install ALL shared libraries and 
  # resource files. This ensures critical GPU libraries like libGLESv2.so and 
  # libEGL.so are never missed.
  find "${_cef_build}" -maxdepth 1 -type f \( -name "*.so" -o -name "*.so.*" \) -exec install -m 755 {} "${pkgdir}/usr/lib/${_pkgname}/" \;
  find "${_cef_build}" -maxdepth 1 -type f \( -name "*.pak" -o -name "*.dat" -o -name "*.bin" -o -name "*.json" \) -exec install -m 644 {} "${pkgdir}/usr/lib/${_pkgname}/" \;
  
  # Copy the swiftshader fallback directory if upstream included it
  if [ -d "${_cef_build}/swiftshader" ]; then
    cp -r "${_cef_build}/swiftshader" "${pkgdir}/usr/lib/${_pkgname}/"
  fi

  # 4. Install only requested locales (Strips ~130MB of bloat)
  install -d "${pkgdir}/usr/lib/${_pkgname}/locales"
  for _locale in "${_locales[@]}"; do
    # The wildcard ${_locale}* safely catches CEF's generated variants (e.g., en-US_FEMININE.pak)
    for _file in "${_cef_build}/locales/${_locale}"*; do
      if [ -f "$_file" ]; then
        install -m 644 "$_file" "${pkgdir}/usr/lib/${_pkgname}/locales/"
      fi
    done
  done
  
  # 5. Install the wrapper script
  install -m 755 "${srcdir}/nyxt.sh" "${pkgdir}/usr/bin/${_pkgname}"
  
  # 6. Desktop Integration (Application launcher and icon)
  if [ -f "assets/${_pkgname}.desktop" ]; then
    install -m 644 "assets/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  fi
  if [ -f "assets/icons/${_pkgname}_256x256.png" ]; then
    install -m 644 "assets/icons/${_pkgname}_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  fi
  
  # 7. Install licenses
  cp -r licenses/* "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  # 8. Install Lisp source and ASDF definitions
  # This satisfies the CL_SOURCE_REGISTRY override and enables Nyxt's internal 
  # help/introspection system to link to source code properly.
  install -m 644 ${_pkgname}.asd "${pkgdir}/usr/share/${_pkgname}/"
  cp -r source libraries "${pkgdir}/usr/share/${_pkgname}/"
  
  # 9. Manual Stripping
  # Because options=('!strip') disables automatic stripping to protect the Lisp 
  # heap, the CEF .so files remain massive (~400MB). We manually strip them here.
  find "${pkgdir}/usr/lib/${_pkgname}" -type f \( -name "*.so" -o -name "*.so.*" \) -exec strip --strip-unneeded {} +
}
