# Maintainer: Nicolai VdS <nicolai@nvds.be>
pkgname=obs-plugin-aitum-multistream-git
_pkgname=obs-aitum-multistream
pkgver=1.0.7.r0.g9f36de8
pkgrel=1
pkgdesc="OBS Studio plugin to multistream by aitum"
arch=('x86_64')
url="https://github.com/Aitum/obs-aitum-multistream"
license=('GPL2')
groups=('obs-plugins')
depends=(
    'obs-studio>=30.0.0'
    'qt6-base'
    'curl'
)
makedepends=(
    'cmake'
    'make'
    'gcc'
    'git'
)
provides=('obs-plugin-aitum-multistream')
conflicts=()
options=()
source=('git+https://github.com/Aitum/obs-aitum-multistream.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    
    # Directly modify the problematic part of helpers_common.cmake
    sed -i 's/set_property(TARGET Qt::${component} PROPERTY INTERFACE_COMPILE_FEATURES "")/#set_property(TARGET Qt::${component} PROPERTY INTERFACE_COMPILE_FEATURES "")/' cmake/common/helpers_common.cmake
    
    # Create a toolchain file that will define our Qt setup
    cat > "${srcdir}/toolchain.cmake" << EOF
# Force Qt6
set(QT_VERSION 6 CACHE STRING "OBS Qt version [AUTO, 5, 6]" FORCE)

# Pre-define the _QT_VERSION variable to bypass some detection logic
set(_QT_VERSION 6 CACHE INTERNAL "")

# Pre-set Qt variables
set(QT_FOUND TRUE CACHE INTERNAL "")
set(QT6_FOUND TRUE CACHE INTERNAL "")

# Define a safe version of set_property that ignores ALIAS targets
function(safe_set_property)
  cmake_parse_arguments(arg "APPEND;APPEND_STRING" "TARGET;PROPERTY" "VALUE" \${ARGN})
  if(NOT TARGET \${arg_TARGET})
    return()
  endif()
  
  get_target_property(is_alias \${arg_TARGET} ALIASED_TARGET)
  if(is_alias)
    message(STATUS "Skipping set_property on ALIAS target \${arg_TARGET}")
    return()
  endif()
  
  if(arg_APPEND)
    set_property(TARGET \${arg_TARGET} APPEND PROPERTY \${arg_PROPERTY} \${arg_VALUE})
  elseif(arg_APPEND_STRING)
    set_property(TARGET \${arg_TARGET} APPEND_STRING PROPERTY \${arg_PROPERTY} \${arg_VALUE})
  else()
    set_property(TARGET \${arg_TARGET} PROPERTY \${arg_PROPERTY} \${arg_VALUE})
  endif()
endfunction()

# Override set_property command to handle ALIAS targets safely
macro(set_property)
  # Check if this is a TARGET property
  if("\${ARGV0}" STREQUAL "TARGET" AND "\${ARGV2}" STREQUAL "PROPERTY")
    # Extract the target name
    set(_target_name "\${ARGV1}")
    
    # Check if this is an ALIAS target
    get_target_property(_aliased_target \${_target_name} ALIASED_TARGET)
    if(_aliased_target)
      message(STATUS "Skipping set_property on ALIAS target \${_target_name}")
    else()
      _set_property(\${ARGN})
    endif()
    
    unset(_target_name)
    unset(_aliased_target)
  else()
    _set_property(\${ARGN})
  endif()
endmacro()
EOF
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    # Set up environment variables to help with Qt detection
    export CMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6:/usr/lib/cmake"
    
    cmake -S . -B build \
        -DCMAKE_TOOLCHAIN_FILE="${srcdir}/toolchain.cmake" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_OUT_OF_TREE=On \
        -DQT_VERSION=6
        
    cmake --build build
}

package() {
    _prjdir="${srcdir}/${_pkgname}"
    install -D -m755 "${_prjdir}/build/aitum-multistream.so" "${pkgdir}/usr/lib/obs-plugins/aitum-multistream.so"
    install -D -m644 "${_prjdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/aitum-multistream"
    cp -r "${_prjdir}/data/locale" "${pkgdir}/usr/share/obs/obs-plugins/aitum-multistream/locale"
}
