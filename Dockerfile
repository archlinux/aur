FROM archlinux

# base-devel is required for building.
#
# gtk3 is an optional dependency, but to that all linked libraries are satisfied,
# we also install it.
RUN pacman -Syy --noconfirm base-devel gtk3

RUN useradd build

RUN bash -c "echo 'build ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/build"

COPY . /home/build/src/droidcam

WORKDIR /home/build/src/droidcam

RUN chown build: -R /home/build/src

RUN sudo -u build makepkg -scir --noconfirm

# List all linked dependencies.
RUN bash -c 'ldd $(which droidcam) $(which droidcam-cli)'

# If some linked libraries are not found, fail.
RUN bash -c '(ldd $(which droidcam) $(which droidcam-cli) | grep "not found" && exit 1) || exit 0'
