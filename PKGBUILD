# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>
# Matlab packaging for archlinux

name=MATLAB
version='2020a'
instdir="/opt/tmw/${name}-${version}"
pkgname=matlab
pkgver=9.8.0.1323502
pkgrel=1
pkgdesc='A high-level language for numerical computation and visualization'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
makedepends=('gendesk' 'python' 'findutils' 'libselinux')
# For 2020a; from https://hub.docker.com/r/mathworks/matlab-deps/dockerfile
# Some of the dependencies are probably not needed; if in case contact the maintainer
depends=(
  'ca-certificates'
  'lsb-release'
  'alsa-lib'
  'atk'
  'libcap'
  'libcups'
  'libdbus'
  'fontconfig'
  'libgcrypt'
  'gdk-pixbuf2'
  'gst-plugins-base'
  'gstreamer'
  'gtk2'
  'krb5'
  'nspr'
  'nss'
  'pam'
  'pango'
  'cairo'
  'libselinux'
  'libsm'
  'libsndfile'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxft'
  'libxi'
  'libxmu'
  'libxrandr'
  'libxrender'
  'libxslt'
  'libxss'
  'libxt'
  'libxtst'
  'libxxf86vm'
  'procps-ng'
  'xorg-server-xvfb'
  'x11vnc'
  'sudo'
  'zlib')
# These I got from arch before and afraid to play around
depends+=(
  'gcc6'
  'gconf'
  'glu'
  'gstreamer0.10-base'
  'libunwind'
  'libxp'
  'libxpm'
  'portaudio'
  'qt5-svg'
  'qt5-webkit'
  'qt5-websockets'
  'qt5-x11extras'
  'xerces-c')
provides=('matlab-licenses' 'matlab-engine-for-python' 'matlab-bin')
source=("matlab.tar.gz"
  "matlab.fik"
  "matlab.lic"
  "matlab.script")
md5sums=(SKIP SKIP SKIP SKIP)

# Limit products to lower size, set this to true to do a partial install
partialinstall=false
# Example list of products for a partial install; check README.md for details
products=(
  "MATLAB"
  #---MATLAB Product Family---#
  "Curve_Fitting_Toolbox"           # Math and Optimization
  "Database_Toolbox"              # Database Access and Reporting
  "Deep_Learning_Toolbox"
  "Global_Optimization_Toolbox"
  "GPU_Coder"
  "MATLAB_Coder"                # Code Generation
  "MATLAB_Compiler"               # Application Deployement
  "MATLAB_Compiler_SDK"
  "Optimization_Toolbox"
  "Parallel_Computing_Toolbox"        # Parallel computing
  "Partial_Differential_Equation_Toolbox"
  "Reinforcement_Learning_Toolbox"
  "Statistics_and_Machine_Learning_Toolbox"   # AI, Data Science, Statistics
  "Symbolic_Math_Toolbox"
  "Text_Analytics_Toolbox"
  #---Application Products---#
  "Audio_Toolbox"
  "Bioinformatics_Toolbox"          # Computational Biology
  "Computer_Vision_Toolbox"
  "Image_Processing_Toolbox"          # Image Processing and Computer Vision
  "Signal_Processing_Toolbox"         # Signal Processing
  "Wavelet_Toolbox"
)

prepare() {
  # Extract file installation key
  _fik=$(grep -o '[0-9-]*' "${srcdir}/${pkgname}.fik")

  # Modify the installer settings'
  _set="${srcdir}/${pkgname}/installer_input.txt"
  sed -i "s|^# destinationFolder=|destinationFolder=${srcdir}/build|" "${_set}"
  sed -i "s|^# fileInstallationKey=|fileInstallationKey=${_fik}|"   "${_set}"
  sed -i "s|^# agreeToLicense=|agreeToLicense=yes|"           "${_set}"
  sed -i "s|^# licensePath=|licensePath=${srcdir}/matlab.lic|"    "${_set}"

  # Select products if partialinstall is set
  if [ "${partialinstall}" = 'true' ]; then
    for _prod in "${products[@]}"; do
      sed -i 's|^#\(product.'"${_prod}"'\)|\1|' "${_set}"
    done
  fi

  # Desktop file
  # Implemented a fix for intel gpus with mesa 20;
  # https://wiki.archlinux.org/index.php/MATLAB#OpenGL_acceleration
  # https://wiki.archlinux.org/index.php/Intel_graphics#Old_OpenGL_Driver_(i965)
  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --categories "Development;Education;Science;Mathematics;IDE" \
    --mimetypes "application/x-matlab-data;text/x-matlab" \
    --exec 'sh -c '\''if [ "${MATLAB_INTEL_OVERRIDE}" = "yes" ] ; then exec env MESA_LOADER_DRIVER_OVERRIDE=i965 matlab -desktop ; else exec matlab -desktop ; fi'\'
}

build() {
  # Using the installer with the -inputFile parameter will automatically
  #   cause the installation to be non-interactive
  "${srcdir}/${pkgname}/install" -inputFile "${srcdir}/${pkgname}/installer_input.txt"

  # Create spoofing for Python API
  # https://aur.archlinux.org/packages/matlab-engine-for-python/
  cd "${srcdir}/build/extern/engines/python"
  # Getting appropriate python version for spoofing
  _matminor="$(find "${srcdir}/build/extern/engines/python" \
    -name 'matlabengineforpython3*.so' |
    sort |
    sed 's|.*matlabengineforpython3_\([0-9]\)\.so|\1|g' |
    tail -1)"
  echo 'import sys' > "${srcdir}/sitecustomize.py"
  echo "sys.version_info = (3, ${_matminor}, 0)" >> "${srcdir}/sitecustomize.py"

}

package() {
  # Install the python API
  # https://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html
  cd "${srcdir}/build/extern/engines/python"
  PYTHONPATH="${srcdir}" python setup.py \
    install --root="${pkgdir}" --optimize 1
  # Spoofing trick to fool matlab into believing 3.8 is supported
  _matminor="$(find "${srcdir}/build/extern/engines/python" \
    -name 'matlabengineforpython3*.so' |
    sort |
    sed 's|.*matlabengineforpython3_\([0-9]\)\.so|\1|g' |
    tail -1)"
  _prefix="$(python -c 'import sys; print(sys.prefix)')"
  _pytminor="$(python -c 'import sys; print(sys.version_info.minor)')"
  # Correct file names
  if [[ "${_pytminor}" != "${_matminor}" ]]; then
    mv "${pkgdir}/${_prefix}/lib/python3".{"${_matminor}","${_pytminor}"}
    _egginfo="$(ls "${pkgdir}/${_prefix}/lib/python3.${_pytminor}/site-packages/"*"-py3.${_matminor}.egg-info")"
    mv "${_egginfo}" "${_egginfo%py3."${_matminor}".egg-info}py3.${_pytminor}.egg-info"
    sed -i "s|sys.version_info|(3, $_matminor, 0)|" \
      "${pkgdir}/${_prefix}/lib/python3.${_pytminor}/site-packages/matlab/engine/__init__.py"
  fi
  # Fix erronous referances in the _arch.txt files
  errstr="${srcdir}/build/extern/engines/python/"
  trustr="${instdir}/extern/engines/python/"
  for _dir in \
    "${srcdir}/build/extern/engines/python/build/lib/matlab/engine" \
    "${pkgdir}/${_prefix}/lib/python3.${_pytminor}/site-packages/matlab/engine" \
    ; do
    sed -i "s|${errstr}|${trustr}|" "${_dir}/_arch.txt"
  done

  # Moving files from build area
  install -dm 0755 "$(dirname "${pkgdir}/${instdir}")"
  mv "${srcdir}/build" "${pkgdir}/${instdir}"

  # Copying license
  install -D -m644 "${srcdir}/${pkgname}/license_agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Symlink executables'
  install -d -m755 "${pkgdir}/usr/bin/"
  for _executable in deploytool matlab mbuild mcc; do
    ln -s "${instdir}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done
  # This would otherwise conflict with mixtex
  ln -s "${instdir}/bin/mex" "${pkgdir}/usr/bin/mex-${pkgname}"
  # Why is this in this directory, I wonder...
  ln -s "${instdir}/bin/glnxa64/mlint" "${pkgdir}/usr/bin/mlint"

  # Install desktop files
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Create backup directories
  mkdir -p "${pkgdir}/${instdir}/backup/bin/glnxa64/mexopts"
  mkdir -p "${pkgdir}/${instdir}/backup/sys/os/glnxa64"

  # Link mex options to ancient libraries
  sysdir="bin/glnxa64/mexopts"
  mkdir -p "${pkgdir}/${instdir}/backup/${sysdir}"
  cp "${pkgdir}/${instdir}/${sysdir}/gcc_glnxa64.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/gcc/gcc-6/g" "${pkgdir}/${instdir}/${sysdir}/gcc_glnxa64.xml"
  cp "${pkgdir}/${instdir}/${sysdir}/g++_glnxa64.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/g++/g++-6/g" "${pkgdir}/${instdir}/${sysdir}/g++_glnxa64.xml"
  cp "${pkgdir}/${instdir}/${sysdir}/gfortran.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/gfortran/gfortran-6/g" "${pkgdir}/${instdir}/${sysdir}/gfortran.xml"
  cp "${pkgdir}/${instdir}/${sysdir}/gfortran6.xml" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  sed -i "s/gfortran/gfortran-6/g" "${pkgdir}/${instdir}/${sysdir}/gfortran6.xml"

  # Remove unused library files
  # <MATLABROOT>/sys/os/glnxa64/README.libstdc++
  sysdir="sys/os/glnxa64"
  mkdir -p "${pkgdir}/${instdir}/backup/${sysdir}"
  mv "${pkgdir}/${instdir}/${sysdir}/"{libstdc++.so.6.0.22,libstdc++.so.6} \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  mv "${pkgdir}/${instdir}/${sysdir}/libgcc_s.so.1" \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  mv "${pkgdir}/${instdir}/${sysdir}/"{libgfortran.so.3.0.0,libgfortran.so.3} \
    "${pkgdir}/${instdir}/backup/${sysdir}/"
  mv "${pkgdir}/${instdir}/${sysdir}/"{libquadmath.so.0.0.0,libquadmath.so.0} \
    "${pkgdir}/${instdir}/backup/${sysdir}/"

  # make sure MATLAB can find libgfortran.so.3
  mkdir -p "${pkgdir}/${instdir}/backup/bin"
  cp "${pkgdir}/${instdir}/bin/matlab" "${pkgdir}/${instdir}/backup/bin"
  sed -i 's|LD_LIBRARY_PATH="`eval echo $LD_LIBRARY_PATH`"|LD_LIBRARY_PATH="`eval echo $LD_LIBRARY_PATH`:/usr/lib/gcc/x86_64-pc-linux-gnu/'$(pacman -Q gcc6 | awk '{print $2}' | cut -d- -f1)'"|g' "${pkgdir}/${instdir}/bin/matlab"

  # https://bbs.archlinux.org/viewtopic.php?id=236821
  # These steps were deleted cause matlab switched to new freetype

  # Install the script file to make scripting easier with matlab
  install -Dm 0755 "${srcdir}/matlab.script" "${pkgdir}/usr/bin/matscript"
}
