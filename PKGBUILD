# Maintainer: Swyter <swyterzone+aur@gmail.com>

pkgname=intel-gpa-bin
url='https://intel.com/content/www/us/en/developer/tools/graphics-performance-analyzers/overview.html'
pkgrel=4
pkgver=23.2.1686276958
options=(!strip)
arch=('x86_64')
license=('custom')
pkgdesc="Intel® Graphics Performance Analyzers (Intel® GPA) provides tools for graphics analysis and optimizations for making games and other graphics-intensive applications run even faster."

source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/46f856a1-7346-4305-b47f-b38b1a2dd9f9/gpa_${pkgver}_release_m64_deb_install.sh")
sha1sums=('d8db1524ab3639fdfb631e86ae34a0aaf386375f')
makedepends=(binutils tar sed)
depends=(libffi7) # swy: it needs libffi.so.7, but they forgot to bundle it

build() {
    # swy: wrap the called commands with our customized/dummied out versions
    mktemp() {
        echo "./" # swy: dump the .deb here, same folder
    }

    dpkg() {
        echo "$@" # swy: don't install, we're not ubuntu
    }

    rm() {
        echo "$@" # swy: don't remove it afterwards
    }

    export -f mktemp
    export -f dpkg
    export -f rm

	cd "$srcdir/"

    # swy: call the shell-based script that normally installs the self-contained .deb file
    yes 'yes' | sh ./gpa_${pkgver}_release_m64_deb_install.sh

    unset rm

    # swy: extract the files from the .deb file
    ar x intel-gpa_tmp.deb && tar -xvf data.tar.xz
}

package() {
	cd "$srcdir"

    cp -r "${srcdir}/opt" ${pkgdir}
    cp -r "${srcdir}/usr" ${pkgdir}

    # swy: these are all legal documents
    mv ${pkgdir}/usr/share/doc ${pkgdir}/usr/share/licenses

    # swy: don't hide the error/warning logging when running on a terminal
    sed -i -e 's|> /dev/null 2>&1||g' ${pkgdir}/usr/bin/gpa-*

    # swy: strip out the whole forced opt-in Google Analytics functionality
    rm -rf "${pkgdir}/opt/intel/gpa/IntelAnalytics"

    # swy: fix the crash at startup on AMD CPUs: terminate called after throwing an instance of 'CpuEnumerator::InconsistentProcessAffinity'
    #                                            what():  This process is restricted and not able to run on all logical processors managed by OS
    #      function by skipping the affinity core loop altogether, patch the
    #          - com/intel/framedb/libframedb_qt.so                   used by FrameAnalyzer and
    #          - com/intel/monitor_presenters/libMonitorPresenters.so used by GpaMonitor,
    #          - and the GpaServer ELF itself,
    #      using a generic, binary-agnostic pattern:
    #      ff 41 8b 04 24 85 c0 74 ->
    #      ff 31 c0 90 90 85 c0 74

    # i.e. original disassembly:
    #    0089a98c 31 c0           XOR        EAX,EAX
    #    0089a98e 48 89 e2        MOV        RDX,RSP
    #    0089a991 e8 8a 6d        CALL       <EXTERNAL>::sched_getaffinity
    #             a1 ff
    #    0089a996 41 8b 04 24     MOV        EAX,dword ptr [R12] /* swy: <-- restore the saved param_1 thrashed register after the call */
    #    0089a99a 85 c0           TEST       EAX,EAX             /* swy: if (param_1 == 0) */
    #    0089a99c 74 53           JZ         LAB_0089a9f1        /* swy: goto ret_early; */

    # patched disassembly:
    #    0089a98c 31 c0           XOR        EAX,EAX
    #    0089a98e 48 89 e2        MOV        RDX,RSP
    #    0089a991 e8 8a 6d        CALL       <EXTERNAL>::sched_getaffinity
    #             a1 ff
    #    0089a996 31 c0           XOR        EAX,EAX             /* swy: <-- patched; set param_1 to zero */
    #    0089a998 90              NOP                            /* swy: <-- patched; nothing */
    #    0089a999 90              NOP                            /* swy: <-- patched; even more nothing; byte pad */
    #    0089a99a 85 c0           TEST       EAX,EAX             /* swy: if (param_1 == 0) */
    #    0089a99c 74 53           JZ         LAB_0089a9f1        /* swy: goto ret_early; */


    # sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' '${pkgdir}/opt/intel/gpa/*.so'

    # swy: find who's affected with a `grep -R 'This process is restricted and not able to run on all logical processors' /opt/intel/gpa/`
    # swy: boom, now it launches!
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/playback"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/GpaPlayer"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/libGLHUD.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/x86/libGLHUD.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/x86/libGLESTrace.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/x86/libGLESCapture.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/GpaServer"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/libGLESTrace.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/libRealtimePresenters.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/libTracePresenters.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/com/intel/framedb/libframedb_qt.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/com/intel/openfiledialog/libOpenFileDialog.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/com/intel/common_presenters/libQTCommonPresenters.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/com/intel/monitor_presenters/libMonitorPresenters.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/com/intel/ta_presenters/libTraceAnalyzerPresenters.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/com/intel/sa_presenters/libSystemAnalyzerPresenters.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/Streams/libStreamPlayback.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/Streams/libStreamPlayer.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/libGLESCapture.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/libGLPlayer.so"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/GpaRemotePlayer"
    sed -i -e 's|\xff\x41\x8b\x04\x24\x85\xc0\x74|\xff\x31\xc0\x90\x90\x85\xc0\x74|g' "${pkgdir}/opt/intel/gpa/libTimelinePresenters.so"
}