# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Mansour Behabadi <mansour@oxplot.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Geoff Hill <geoff@geoffhill.org>
# Contributor: Sebastien Bariteau <numkem@numkem.org>
# Contributor: Justin Dray <justin@dray.be>

pkgname="google-cloud-sdk"
pkgver=275.0.0
pkgrel=1
pkgdesc="A set of command-line tools for the Google Cloud Platform. Includes gcloud (with beta and alpha commands), gsutil, and bq."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
depends=('python' 'python2')
optdepends=(
  "python: [cli] beta support for python3. see https://cloud.google.com/sdk/gcloud/reference/topic/startup"
  "python2-crcmod: [gsutil] verify the integrity of GCS object contents"
)
options=('!strip' 'staticlibs')
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
  "google-cloud-sdk.sh"
)
sha256sums=('32e377dc425d02be9cb95fa6ddfcc57f630482b267be045988cc900e6a3f51d9'
            '36ac88de630e49ea4b067b1f5f229142e4cf97561b98b3bd3d8115a356946692')

package() {
  echo "Copying core SDK components"
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"

  echo "Running bootstrapping script"

  # The Google code uses a _TraceAction() method which spams the screen even
  # in "quiet" mode, we're throwing away output on purpose to keep it clean
  #  ref: lib/googlecloudsdk/core/platforms_install.py
  python "${pkgdir}/opt/${pkgname}/bin/bootstrapping/install.py" \
    --quiet \
    --usage-reporting False \
    --path-update False \
    --bash-completion False \
    --additional-components "" \
    1 > /dev/null

  echo "Cleaning up artifacts of the bootstrap script"
  rm -rf "${pkgdir}/opt/${pkgname}/.install/.backup"
  mkdir "${pkgdir}/opt/${pkgname}/.install/.backup"

  echo "Setting up profile environment variables"
  install -Dm755 "${srcdir}/${source[1]}" \
    "${pkgdir}/etc/profile.d/google-cloud-sdk.sh"

  echo "Installing bash completion script"
  install -Dm755 "${pkgdir}/opt/${pkgname}/completion.bash.inc" \
    "${pkgdir}/etc/bash_completion.d/google-cloud-sdk"

  echo "Installing man pages"
  mkdir -p "${pkgdir}/usr/share"
  mv -f "${pkgdir}/opt/${pkgname}/help/man" "${pkgdir}/usr/share/"
  chmod 0755 "${pkgdir}/usr/share/man"
  chmod 0755 "${pkgdir}/usr/share/man/man1"

  echo "Creating symlinks for applications"
  mkdir -p "${pkgdir}/usr/bin"
  for i in "${pkgdir}/opt/${pkgname}/bin"/*; do
    ln -st "${pkgdir}/usr/bin/" "${i#${pkgdir}}"
  done
  rm -f "${pkgdir}"/usr/bin/{bq,dev_appserver.py*,endpointscfg.py*,java_dev_appserver.sh}

  echo "Fixing file permissions"
  chmod -x "${pkgdir}"/usr/share/man/man1/*
  find "${pkgdir}/opt/${pkgname}" -name "*.html" -o -name "*.json" -exec chmod -x {} \;
  find "${pkgdir}/opt/${pkgname}" -name "*_test.py" -exec chmod +x {} \;
}
