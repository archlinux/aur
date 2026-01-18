# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=job-scheduler
pkgver=26.01
pkgrel=1
pkgdesc="Graphical job scheduling utility for cron"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('qt6-base' 'polkit' 'cronie')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/job-scheduler/archive/refs/tags/26.01.tar.gz")
sha256sums=('accd0a9d711c52364106d015cc9823ef3eafac474e911d103cf2b56d079f218e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/job-scheduler "${pkgdir}/usr/bin/job-scheduler"

    install -dm755 "${pkgdir}/usr/share/job-scheduler/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/job-scheduler/locale/" 2>/dev/null || true

    install -Dm755 scripts/job-scheduler-launcher "${pkgdir}/usr/bin/job-scheduler-launcher"
    install -Dm644 scripts/org.mxlinux.pkexec.job-scheduler-launcher.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.job-scheduler-launcher.policy"

    install -Dm644 job-scheduler.desktop "${pkgdir}/usr/share/applications/job-scheduler.desktop"
    install -Dm644 images/job-scheduler.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/job-scheduler.svg"

    install -dm755 "${pkgdir}/usr/share/doc/job-scheduler"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/job-scheduler/" 2>/dev/null || true
    fi

    install -Dm644 debian/changelog "${pkgdir}/usr/share/doc/job-scheduler/changelog"
    gzip "${pkgdir}/usr/share/doc/job-scheduler/changelog"
}
