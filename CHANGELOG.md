# Planning
- Add diff operation based on downloading remote and git diff.
- Add sandbox operation based on docker or / and k8s.

# 1.0.9-3
- Added history operation,
- Made it possible to install a different git revision over --git-revision (based on git switch --detach, commits can now be explored with the history operation).

# 1.0.9-2 *BREAKING CHANGES*
- Transformed --no-out-of-date into --out-of-date. This leads to the script removing out of date packages from search results by default.
- Transformed --maintained into --not-maintained. This leads to the script removing not maintained packages from search results by default. 

# 1.0.9-1
- Add package suggestion on completion for the new describe operation.
