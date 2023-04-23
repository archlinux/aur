# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Maintainer: sukanka <su975853527[AT]gmail.com>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=matlab
pkgrel=3
pkgver=9.14.0.2239454
pkgdesc='A high-level language for numerical computation and visualization'
arch=(x86_64)
url='https://www.mathworks.com'
license=(custom)
depends=(matlab-meta)
makedepends=('gendesk')
provides=('matlab-bin')
source=('local://matlab.tar' 'local://matlab.fik' 'local://matlab.lic')
b2sums=('SKIP' 'SKIP' 'SKIP')

# Example list of products for a partial installation. Leave empty for a full installation.
_products=(
    'MATLAB'
    'Simulink'
)

pkgver() {
    sed --quiet 's|\s*<version>\(.*\)</version>\s*|\1|p' "$srcdir/matlab/VersionInfo.xml"
}

prepare() {
    echo "  -> Modifying installer settings..."
    _fik=$(grep -o '[0-9-]*' "$srcdir/matlab.fik")
    _options="$srcdir/matlab/installer_input.txt"
    sed -i "s|^# destinationFolder=|destinationFolder=$srcdir/build|" "$_options"
    sed -i "s|^# fileInstallationKey=|fileInstallationKey=$_fik|"     "$_options"
    sed -i "s|^# agreeToLicense=|agreeToLicense=yes|"                 "$_options"
    sed -i "s|^# outputFile=|outputFile=$srcdir/../install.log|"      "$_options"
    sed -i "s|improveMATLAB=yes|improveMATLAB=no|"                    "$_options"
    sed -i "s|^# licensePath=|licensePath=$srcdir/matlab.lic|"        "$_options"

    if [ "${#_products[@]}" -gt '0' ]; then
        echo "  -> Setting specified products to be installed..."
        for _product in "${_products[@]}"; do
            sed -i 's|^#\(product.'"$_product"'\)$|\1|' "$_options"
        done
    fi
}

build() {
    echo "  -> Running original installer..."
    # -inputFile makes the installation non-interactive.
    "$srcdir/matlab/install" -inputFile "$srcdir/matlab/installer_input.txt"

    # If "$srcdir/build" does not exist, the installer failed.
    if [ -z "$(ls -A "$srcdir/build")" ]; then
        echo "==> ERROR: MATLAB installer failed, check install.log"
        exit 1
    fi

    echo "  -> Generating desktop files..."
    _release="$(sed --quiet 's|\s*<release>\(.*\)</release>\s*|\1|p' \
        "$srcdir/matlab/VersionInfo.xml")"
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
}

package() {
    _release="$(sed --quiet 's|\s*<release>\(.*\)</release>\s*|\1|p' \
        "$srcdir/matlab/VersionInfo.xml")"
    _matlabdir=opt/MATLAB
    _instdir=opt/MATLAB/$_release
    install -dm755 "$pkgdir/$_matlabdir"
    install -dm777 "$pkgdir/$_instdir"

    # Needed for programs like python-matlabengine which expect MATLAB to be in /usr/local
    install -dm755 "$pkgdir/usr/local"
    ln -s /$_matlabdir "$pkgdir/usr/local/MATLAB"

    echo "  -> Moving files from build area to package area directly to save space..."
    mv "$srcdir/build/"* "$pkgdir/$_instdir"

    echo "  -> Installing desktop files..."
    install -Dm644 "$srcdir/matlab.desktop" \
        "$pkgdir/usr/share/applications/matlab.desktop"
    install -Dm644 "$srcdir/matlab/bin/glnxa64/cef_resources/matlab_icon.png" \
        "$pkgdir/usr/share/pixmaps/matlab.png"

    echo "  -> Symlinking executables..."
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

    echo "  -> Forcing MATLAB to use system libraries..."

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
    sed -i "s/gcc/gcc-10/g"           "$_srcdir/gcc_glnxa64.xml"
    sed -i "s/g++/g++-10/g"           "$_srcdir/g++_glnxa64.xml"
    sed -i "s/gfortran/gfortran-10/g" "$_srcdir/gfortran.xml"
    sed -i "s/gfortran/gfortran-10/g" "$_srcdir/gfortran6.xml"

    _srcdir="$pkgdir/$_instdir/sys/os/glnxa64"
    _dstdir="$pkgdir/$_instdir/backup/sys/os/glnxa64"
    install -dm755 "$_dstdir"
    # These are obsolete libraries
    mv "$_srcdir"/libstdc++.so.*   "$_dstdir"
    mv "$_srcdir"/libgcc_s.so.*    "$_dstdir"
    mv "$_srcdir"/libgfortran.so.* "$_dstdir"
    mv "$_srcdir"/libquadmath.so.* "$_dstdir"

    echo "  -> Installing license..."
    install -Dm644 "$srcdir/matlab/license_agreement.txt" \
        "$pkgdir/usr/share/licenses/matlab/LICENSE"
}
