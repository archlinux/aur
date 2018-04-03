# Maintainer: Troy Engel <troyengel+arch@gmail.com>

_srcpkg="google-cloud-sdk"
pkgname="google-cloud-sdk-minimal"
pkgver=196.0.0
pkgrel=1
pkgdesc="Minimal SDK for the Google Cloud Platform (gsutil, gcloud w/beta commands, man pages)"
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
provides=("$_srcpkg")
conflicts=("$_srcpkg")
depends=('python2')
options=('!strip' 'staticlibs')

# Only the "for_packagers" download has the man pages in it
source=("https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${_srcpkg}_${pkgver}.orig.tar.gz"
        "gcp-sdk-profile.sh")
sha256sums=(
        '93b0e12b376390d5ffb26d9b53498d19990aeb198aa3213b60c9af14605ed4ff'
        '36ac88de630e49ea4b067b1f5f229142e4cf97561b98b3bd3d8115a356946692')

prepare() {
  msg2 "Checking for newer upstream release"
  _LATEST=$(curl -s https://dl.google.com/dl/cloudsdk/release/sha256.txt |
            egrep "google-cloud-sdk_.*\.orig\.tar\.gz" | \
            awk -e '{print $2}' | awk -e 'BEGIN{FS="/"}{print $4}' | \
            cut  -d'_' -f2 | sed 's/.orig.*//g')
  msg2 "This AUR release: ${pkgver}"
  msg2 "Latest upstream release: ${_LATEST}"
  if [ "${_LATEST}" != "${pkgver}" ]; then
    msg2 "** Please flag out-of-date at https://aur.archlinux.org/packages/google-cloud-sdk-minimal"
  fi
}

package() {
  msg2 "Copying core SDK components"
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${_srcpkg}" "${pkgdir}/opt"

  msg2 "Running bootstrapping script and adding beta commands"
  # The Google code uses a _TraceAction() method which spams the screen even
  # in "quiet" mode, we're throwing away output on purpose to keep it clean
  #  ref: lib/googlecloudsdk/core/platforms_install.py
  python2 "${pkgdir}/opt/${_srcpkg}/bin/bootstrapping/install.py" --quiet \
    --usage-reporting False --path-update False --bash-completion False \
    --additional-components beta 1>/dev/null

  msg2 "Removing backups created by the bootstrap process"
  rm -rf "${pkgdir}/opt/${_srcpkg}/.install/.backup"
  mkdir "${pkgdir}/opt/${_srcpkg}/.install/.backup"

  msg2 "Setting up environment variables and shell completion"
  install -Dm755 "${pkgdir}/opt/${_srcpkg}/completion.bash.inc" \
    "${pkgdir}/etc/bash_completion.d/google-cloud-sdk"
  install -Dm755 "${srcdir}/gcp-sdk-profile.sh" \
    "${pkgdir}/etc/profile.d/google-cloud-sdk.sh"

  msg2 "Fixing python references for python2 and compiling *.pyc"
  grep -Irl 'python' "${pkgdir}/opt/${_srcpkg}" | \
    xargs sed -i 's|#!.*python\b|#!/usr/bin/env python2|g'
  find "${pkgdir}/opt/${_srcpkg}/bin/" -maxdepth 1 -type f -exec \
    sed -i 's/CLOUDSDK_PYTHON=python\b/CLOUDSDK_PYTHON=python2/g' {} \;
  python2 -m compileall -q -f -x python3 "${pkgdir}/opt/${_srcpkg}/"

  msg2 "Installing man pages"
  mkdir -p "${pkgdir}/usr/share"
  mv -f "${pkgdir}/opt/${_srcpkg}/help/man" "${pkgdir}/usr/share/"
  chmod 0755 "${pkgdir}/usr/share/man"
  chmod 0755 "${pkgdir}/usr/share/man/man1"
  rm -f "${pkgdir}"/usr/share/man/man1/gcloud_alpha*

  msg2 "Creating symlinks for applications"
  mkdir -p "${pkgdir}/usr/bin"
  find "${pkgdir}/opt/${_srcpkg}/bin" -maxdepth 1 -type f -printf \
    "/opt/${_srcpkg}/bin/%f\n" | xargs ln -st "${pkgdir}/usr/bin"
  rm -f "${pkgdir}"/usr/bin/{bq,dev_appserver.py*,endpointscfg.py*,java_dev_appserver.sh}

  # Fix tarball file permissions
  msg2 "Fixing file permissions"
  chmod -x "${pkgdir}"/usr/share/man/man1/*
  find "${pkgdir}/opt/${_srcpkg}" -name "*.html" -print0 | xargs -0 chmod -x
  find "${pkgdir}/opt/${_srcpkg}" -name "*.json" -print0 | xargs -0 chmod -x
  find "${pkgdir}/opt/${_srcpkg}" -name "*_test.py" -print0 | xargs -0 chmod +x
}

