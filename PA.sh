#!/bin/sh

if [ ! -x $HOME/.local/Uber\ Entertainment/PA/PTE/PA ]; then
  echo Please run PA-pte to download the PTE build of the game first.
else
  exec $HOME/.local/Uber\ Entertainment/PA/PTE/PA
fi;
