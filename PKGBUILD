# Maintainer: Christos Longros <chris.longros@gmail.com>

pkgname=ants-bin
_pkgname=ants
pkgver=2.6.5
pkgrel=1
pkgdesc="Advanced Normalization Tools (ANTs): medical image registration and segmentation (prebuilt binary)"
arch=('x86_64')
url='https://github.com/ANTsX/ANTs'
license=('Apache-2.0')
depends=(
    'glibc'
    'gcc-libs'
)
optdepends=(
    'r: for R-based ANTs scripts (antsBOLDNetworkAnalysis, antsLaplacianBoundaryCondition, antsNetworkAnalysis)'
    'perl: for queue-wait helper scripts (waitFor{PBSQ,SGEQ,Slurm}Jobs.pl, antsNeuroimagingBattery)'
    'bash: for ANTs shell pipelines'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
source=("https://github.com/ANTsX/ANTs/releases/download/v${pkgver}/ants-${pkgver}-almalinux9-X64-gcc.zip")
sha256sums=('e7410139964dc493b41be7cef720cc6231ea7456b937505bcf84a424011c3002')

package() {
    install -dm755 "$pkgdir/opt/ants/bin"
    cp -a "$srcdir/ants-${pkgver}/bin/." "$pkgdir/opt/ants/bin/"

    install -dm755 "$pkgdir/usr/bin"
    for f in "$srcdir/ants-${pkgver}/bin/"*; do
        n=$(basename "$f")
        cat > "$pkgdir/usr/bin/$n" <<EOF
#!/bin/sh
export ANTSPATH=/opt/ants/bin/
exec /opt/ants/bin/$n "\$@"
EOF
        chmod 755 "$pkgdir/usr/bin/$n"
    done

    install -dm755 "$pkgdir/etc/profile.d"
    cat > "$pkgdir/etc/profile.d/ants.sh" <<'EOF'
export ANTSPATH=/opt/ants/bin/
EOF
    chmod 644 "$pkgdir/etc/profile.d/ants.sh"
}
