FROM samip537/archlinux:yay
WORKDIR /app
COPY PKGBUILD ./
CMD makepkg -f && makepkg --printsrcinfo > /volume/.SRCINFO

VOLUME /volume