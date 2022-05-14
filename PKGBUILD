# Maintainer: zhs <zhao4she4@tuta.io>
# systemd unit taken from the release version one by techknowlogick

pkgname=ignite-git
_pkgname=ignite
pkgver=r1819.c4162ac6
pkgrel=1
pkgdesc="Weaveworks Ignite, combines Firecracker MicroVMs with Docker/OCI \
images to unify containers and VMs, GIT version."
arch=('x86_64')
url="https://github.com/weaveworks/ignite"
makedepends=('go' 'git' 'docker')
depends=('containerd' 'cni-plugins')
license=('apache')
provides=('ignite-git')
conflicts=('ignite')
source=(
	"git+https://github.com/weaveworks/ignite/"
	"ignited.service"
)
sha256sums=('SKIP'
            'd8719fd5744f790f78ff027eb8c82ad917d5a96a688e406f1ab6dcbf2bb9ec30')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # this uses the official docker way to build this package because quite often
  # the golang version installed on an arch linux system does not match what it
  # expects. for example, as of this writing, arch linux ships 1.18 while this
  # only correctly builds with the latest golang 1.17

	cd "${srcdir}/${_pkgname}"
  
  # the user building this package should either be a member of 'docker' group
  # or have sudo rights to run docker
  if id -nG "${USER}" | grep -qw "docker"; then
    echo "info: user \'${USER}\' is in 'docker' group. proceeding..."
    export DOCKER="docker"
  elif sudo -l | grep -qw "ALL\|/usr/bin/docker"; then
    echo "info: user '${USER}' is allowed to run 'sudo docker'. proceeding..."
    export DOCKER="sudo docker"
  else
    echo "error: '${USER}' neither is in 'docker' group nor can run 'sudo \
docker'. aborting..."
    exit 1
  fi
  
  # docker daemon/engine has to be running
  while (! ${DOCKER} stats --no-stream 1>/dev/null 2>&1); do
    echo "waiting for docker daemon to start up..."
    sleep 1
  done

  # we need to do this because we are running docker from a script
  sed -i 's/$(DOCKER) run -i/$(DOCKER) run/' Makefile
  make DOCKER="${DOCKER}"
}

package() {
  cd "${srcdir}"
 	install -D -m644 "ignited.service" "${pkgdir}/usr/lib/systemd/system/ignited.service"
	install -D -m755 "${_pkgname}/bin/amd64/ignite" "${pkgdir}/usr/bin/ignite"
	install -D -m755 "${_pkgname}/bin/amd64/ignited" "${pkgdir}/usr/bin/ignited"
	install -D -m755 "${_pkgname}/bin/amd64/ignite-spawn" "${pkgdir}/usr/bin/ignite-spawn"
}

