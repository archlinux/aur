# Maintainer: user981257923
pkgname=vital-synth
pkgver=1.5.5
pkgrel=7
pkgdesc="Spectral warping wavetable synth. Manual download of .deb installer required."
arch=('x86_64')
url="https://vital.audio"
license=('custom')
provides=('vital')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7' 'zenity')
install=${pkgname}.install

pkgname_deb="VitalInstaller" # The base name of the .deb file
filename_deb="${pkgname_deb}.deb" # The full filename expected
versioned_filename_deb="${pkgname_deb}-${pkgver}.deb"


prepare() {

echo "The AUR moderators have prohibited mirroring ${filename_deb}, so unfortunately \
the users will now be required to manually download the file on their own \
from ${url}."

    # Check if the .deb source file already exists in the srcdir (PKGBUILD directory)
    if [[ ! -f "${srcdir}/${versioned_filename_deb}" ]]; then
echo "Please select the '${filename_deb}' file you manually downloaded from ${url} in the dialog box. \
If you haven't done so already, cancel the dialog, download the file and run the setup again."


        local downloaded_file=""
        downloaded_file=$(zenity --file-selection \
                                --title="Select '${filename_deb}' for Vital Synth" \
                                --text="Please select the '${filename_deb}' file you manually downloaded from ${url}." \
                                --file-filter="*.deb" \
                                --file-filter="${filename_deb}")

        if [[ -z "${downloaded_file}" ]]; then
        error "No file selected. Aborting build."
        exit 1
        fi

        if [[ "$(basename "${downloaded_file}")" != "${filename_deb}" ]]; then
        error "Selected file is not '${filename_deb}'. Please select the correct file."
        exit 1
        fi

        # Copy the selected file to the source directory expected by makepkg
        msg "Copying '${downloaded_file}' to '${srcdir}/${versioned_filename_deb}'..."
        cp "${downloaded_file}" "${srcdir}/${versioned_filename_deb}"
    fi

    # Extract the contents of the .deb file
    msg "Extracting contents of ${versioned_filename_deb}..."
    cd "${srcdir}"
    ar x "${srcdir}/${versioned_filename_deb}"

    # Extract data.tar.gz (the actual package contents)
    # if [[ -f "data.tar.gz" ]]; then
    #     tar xzf data.tar.gz
    # elif [[ -f "data.tar.xz" ]]; then # In case it's xz compression
    #     tar xJf data.tar.xz
    # else
    #     error "Could not find data.tar.gz or data.tar.xz inside ${versioned_filename_deb}. Please check the .deb file."
    #     exit 1
    # fi
}

package() {
    # echo $pkgdir
    # pwd
    # ls

	## Extract package data
	# tar xf data.tar.gz -C "${pkgdir}"
    if [[ -f "data.tar.gz" ]]; then
        tar xzf data.tar.gz -C "${pkgdir}"
    elif [[ -f "data.tar.xz" ]]; then # In case it's xz compression
        tar xJf data.tar.xz -C "${pkgdir}"
    else
        error "Could not find data.tar.gz or data.tar.xz inside ${versioned_filename_deb}. Please check the .deb file."
        exit 1
    fi

    ## license seems to not be included anymore
	# install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # mkdir -p "${pkgdir}/usr/share/{applications,pixmaps}"
    install -D -m644 "${srcdir}/../vital.desktop" "${pkgdir}/usr/share/applications/vital.desktop"
    install -D -m644 "${srcdir}/../vital.png" "${pkgdir}/usr/share/pixmaps/vital.png"
}