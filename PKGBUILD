# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Maintainer: sukanka <su975853527[AT]gmail.com>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=matlab
pkgrel=4
pkgver=9.13.0.2049777
pkgdesc='A high-level language for numerical computation and visualization'
arch=(x86_64)
url='https://www.mathworks.com'
license=(custom)
depends=(matlab-meta)
makedepends=('gendesk')
provides=('matlab' 'matlab-bin')
source=('local://matlab.tar' 'local://matlab.fik' 'local://matlab.lic')
b2sums=(SKIP SKIP SKIP)

# Example list of products for a partial install. Leave empty for a full installation.
_products=(
  'MATLAB'
  'Simulink'
)

pkgver() {
  cat "$srcdir/matlab/VersionInfo.xml" | sed --quiet 's|\s*<version>\(.*\)</version>\s*|\1|p'
}

prepare() {
  msg2 "Modifying installer settings..."
  _fik=$(grep -o '[0-9-]*' "$srcdir/matlab.fik")
  _options="$srcdir/matlab/installer_input.txt"
  sed -i "s|^# destinationFolder=|destinationFolder=$srcdir/build|" "$_options"
  sed -i "s|^# fileInstallationKey=|fileInstallationKey=$_fik|"     "$_options"
  sed -i "s|^# agreeToLicense=|agreeToLicense=yes|"                 "$_options"
  sed -i "s|^# outputFile=|outputFile=$srcdir/../install.log|"      "$_options"
  sed -i "s|improveMATLAB=yes|improveMATLAB=no|"                    "$_options"
  sed -i "s|^# licensePath=|licensePath=$srcdir/matlab.lic|"        "$_options"

  # Install specified products if _products is non-empty.
  if [ "${#_products[@]}" -gt '0' ]; then
    for _prod in "${_products[@]}"; do
      sed -i 's|^#\(product.'"$_prod"'\)$|\1|' "$_options"
    done
  fi
}

build() {
  msg2 "Running original installer..."
  # -inputFile makes the installation non-interactive.
  "$srcdir/matlab/install" -inputFile "$srcdir/matlab/installer_input.txt"
}

package() {
  _release="$(cat "$srcdir/matlab/VersionInfo.xml" \
    | sed --quiet 's|\s*<release>\(.*\)</release>\s*|\1|p')"
  _instdir=usr/local/MATLAB/$_release
  install -dm755 "$(dirname "$pkgdir/$_instdir")"

  msg2 "Moving files from build area to package area directly to save space..."
  mv "$srcdir/build" "$pkgdir/$_instdir"

  msg2 "Installing license..."
  install -Dm644 "$srcdir/matlab/license_agreement.txt" \
    "$pkgdir/usr/share/licenses/matlab/LICENSE"

  msg2 "Generating desktop file..."
  gendesk -f -n \
    --pkgname 'matlab' \
    --pkgdesc "$pkgdesc" \
    --name "MATLAB $_release" \
    --genericname 'MATLAB' \
    --comment 'Programming and numeric computing platform' \
    --categories 'Development;Education;Science;Mathematics;IDE' \
    --mimetypes 'application/x-matlab-data;text/x-matlab' \
    --icon 'matlab' \
    --exec 'matlab -desktop'

  msg2 "Installing desktop files..."
  install -Dm644 "$srcdir/matlab.desktop" \
    "$pkgdir/usr/share/applications/matlab.desktop"
  install -Dm644 "$srcdir/matlab/bin/glnxa64/cef_resources/matlab_icon.png" \
    "$pkgdir/usr/share/pixmaps/matlab.png"

  msg2 "Symlinking executables..."
  install -dm755 "$pkgdir/usr/bin/"
  for _exe in deploytool matlab mbuild activate_matlab.sh; do
    ln -s "/$_instdir/bin/$_exe" "$pkgdir/usr/bin/$_exe"
  done
  # This would otherwise conflict with mixtex.
  ln -s "/$_instdir/bin/mex" "$pkgdir/usr/bin/mex-matlab"
  # This would otherwise conflict with Mathematica.
  ln -s "/$_instdir/bin/mcc" "$pkgdir/usr/bin/mcc-matlab"
  # Allow external software to find the MATLAB linter binary.
  ln -s "/$_instdir/bin/glnxa64/mlint" "$pkgdir/usr/bin/mlint"

  msg2 "Forcing MATLAB to use system libraries..."

  _srcdir="$pkgdir/$_instdir/bin/glnxa64"
  _dstdir="$pkgdir/$_instdir/backup/bin/glnxa64"
  install -dm755 "$_dstdir"
  mv "$_srcdir"/libfreetype.so.* "$_dstdir"
  mv "$_srcdir"/libtiff.so.*     "$_dstdir"

  _srcdir="$pkgdir/$_instdir/bin/glnxa64/mexopts"
  _dstdir="$pkgdir/$_instdir/backup/bin/glnxa64/mexopts"
  install -dm755 "$_dstdir"
  install -Dm644 "$_srcdir/gcc_glnxa64.xml" "$_dstdir"
  install -Dm644 "$_srcdir/g++_glnxa64.xml" "$_dstdir"
  install -Dm644 "$_srcdir/gfortran.xml"    "$_dstdir"
  install -Dm644 "$_srcdir/gfortran6.xml"   "$_dstdir"
  sed     -i     "s/gcc/gcc-10/g"           "$_srcdir/gcc_glnxa64.xml"
  sed     -i     "s/g++/g++-10/g"           "$_srcdir/g++_glnxa64.xml"
  sed     -i     "s/gfortran/gfortran-10/g" "$_srcdir/gfortran.xml"
  sed     -i     "s/gfortran/gfortran-10/g" "$_srcdir/gfortran6.xml"

  _srcdir="$pkgdir/$_instdir/sys/os/glnxa64"
  _dstdir="$pkgdir/$_instdir/backup/sys/os/glnxa64"
  install -dm755 "$_dstdir"
  # These are obsolete libraries
  mv "$_srcdir"/libstdc++.so.*   "$_dstdir"
  mv "$_srcdir"/libgcc_s.so.*    "$_dstdir"
  mv "$_srcdir"/libgfortran.so.* "$_dstdir"
  mv "$_srcdir"/libquadmath.so.* "$_dstdir"
}
