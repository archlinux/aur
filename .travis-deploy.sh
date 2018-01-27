#!/bin/bash

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "Pull request, skipping publication to aur"
  exit 0
fi

mkdir -p ~/.ssh
echo -e "Host aur.archlinux.org\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
mv id_rsa ~/.ssh/
chmod 600 ~/.ssh/id_rsa
git remote add aur git+ssh://aur@aur.archlinux.org/home-assistant.git

echo "Pushing to AUR"

git push aur HEAD:master
