# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="pymoldyn"
pkgver="0.9.9"
pkgrel="1"
pkgdesc="A molecule viewer with cavity computation."
arch=("x86_64")
url="https://github.com/sciapp/pyMolDyn"
license=("MIT")
depends=()
makedepends=("git" "podman")
source=("https://github.com/sciapp/pyMolDyn/archive/release-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.patch"
        "qtgr.patch")
sha256sums=("da8fef9c15c9cb762ffb21af989350901b7514673c7f87b6378bfea4a8a15180"
            "4f4391bb18ce31f7603603cc5f489646fc5df97ae5a0800336cbd53cf3af2fe3"
            "48246f36c4b6c89354b32374d3b1624219b35107e33b87e64457b3eb8b5e75ef")

prepare() {
    image_name="$(cat /proc/sys/kernel/random/uuid)" && \
    # Miniconda must not be moved after the installation (because it contains
    # lots of absolute paths to its own install location), so it must be
    # installed to the final destination directly.
    # -> Use Podman as a chroot with extras to be able to select the install
    # location freely during package creation.
    podman build -t "${image_name}" -f - <<-'EOF'
		FROM centos:7

		RUN yum install -y curl mesa-libGL-devel && \
		    yum clean all

		RUN curl -fLO 'https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh' && \
		    chmod +x Miniconda2-latest-Linux-x86_64.sh && \
		    ./Miniconda2-latest-Linux-x86_64.sh -b -p "/opt/pymoldyn/env"

		RUN /opt/pymoldyn/env/bin/conda install -y \
		        h5py \
		        jinja2 \
		        pyopengl \
		        pyqt \
		        python-dateutil && \
		    GR_FORCE_DOWNLOAD=1 /opt/pymoldyn/env/bin/pip install --no-cache-dir 'gr==1.23.2'

		VOLUME /export

		ENTRYPOINT ["mv", "/opt/pymoldyn/env", "/export/"]
	EOF
    podman run --rm --rmi -v "${srcdir}/pyMolDyn-release-${pkgver}:/export" "${image_name}" && \
    cd "${srcdir}/pyMolDyn-release-${pkgver}/env/lib/" && \
    # The system's OpenGL/Mesa drivers usually require the same `libstdc++.so`
    # which is installed on the system, so replace it in the Miniconda
    # environment with a symbolic link to the library of the system itself.
    ln -fs /usr/lib/libstdc++.so.6 && \
    cd "${srcdir}/pyMolDyn-release-${pkgver}/env/lib/python2.7/site-packages/qtgr" && \
    patch -Np2 -i "${srcdir}/qtgr.patch" && \
    cd "${srcdir}/pyMolDyn-release-${pkgver}" && \
    patch -Np1 -i "${srcdir}/${pkgname}-${pkgver}.patch"
    sed \
        -i "s%^SCRIPT_DIR=.*%SCRIPT_DIR=\"${srcdir}/pyMolDyn-release-${pkgver}\"%" \
        build-flags
}

build() {
    cd "${srcdir}/pyMolDyn-release-${pkgver}" && \
    make extensions && \
    cd src && \
    ../env/bin/python2 -m compileall .
}

package() {
    cd "${pkgdir}" && \
    mkdir -p \
        opt \
        usr/bin \
        usr/share/applications \
        usr/share/pixmaps && \
    cp -v "${srcdir}/pyMolDyn-release-${pkgver}/src/icon.png" "usr/share/pixmaps/pymoldyn.png" && \
    mv "${srcdir}/pyMolDyn-release-${pkgver}" "${pkgdir}/opt/pymoldyn" && \
    cat <<-EOF > "usr/bin/pymoldyn" || return
		#!/bin/sh

		/opt/pymoldyn/env/bin/python2 /opt/pymoldyn/src/startGUI.py "\$@"
	EOF
    chmod +x usr/bin/pymoldyn && \
    cat <<-EOF > "usr/share/applications/pyMolDyn.desktop" || return
		[Desktop Entry]
		Categories=Science;
		Comment=A molecule viewer with cavity computation
		Exec=pymoldyn
		GenericName=pyMolDyn
		Icon=pymoldyn
		Name=PyMolDyn
		Terminal=false
		Type=Application
		Version=${pkgver}
	EOF
}
