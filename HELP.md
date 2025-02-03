###### Some notes for maintainer as I can't remember all those commands

## How to bump version

1. Update new version: Bump new version in `PKGBUILD`
2. Pull new package: Run `make force-sync`
3. Check new B2SUM: `make b2sum`
4. Update new B2SUM: copy previous output to `PKGBUILD`
5. Try sync/install new package: `make sync install`
6. Generate new `.SRCINFO`: `make SRCINF`
7. Add and commit modified files.

## How to set up archlinux in docker environment

```shell
docker run --rm -v .:/opt -it archlinux:base-devel
```

```shell
pacman -Sy --noconfirm --disable-sandbox # Update pacman database
pacman -S --noconfirm vim
EDITOR=vim visudo # Uncomment wheel group nopassword
usermod -e 2050-01-01 -g wheel nobody
passwd nobody # Set password for nobody
chown -R nobody:nobody /opt # Allow nobody permission in the directory
su -s /bin/bash nobody # Change user to nobody
cd opt/
## From this, you can follow the instruction above

make force-sync
make b2sum
make install
make SRCINF
```
